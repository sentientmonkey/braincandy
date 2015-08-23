class Parens
  PAIRS = { "[" => "]",
            "{" => "}",
            "(" => ")" }

  COLORS = { red: "\e[31m",
             green: "\e[32m",
             yellow: "\e[33m",
             blue: "\e[34m",
             magenta: "\e[35m",
             cyan: "\e[36m" }

  WHITE = "\e[0m"

  ESCAPE = %w(")

  def initialize
    @output = ""
    @stack = []
    @color_stack = []
    @colors = COLORS.values.cycle
    @buffer = ""
    @escaped = false
  end

  def rainbow text
    text.each_char do |token|
      if escaped? token
        write_buffer token
        next
      end

      case token
      when *ESCAPE
        escape token
      when *PAIRS.keys
        begin_pair token
      when *PAIRS.values
        return false if unmatched? token
        end_pair token
      else
        write_buffer token
      end
    end
    return false unless @stack.empty?
    @output
  end

  def valid? text
    !!rainbow(text)
  end

  private

  def escaped? token
    @escaped && !ESCAPE.include?(token)
  end

  def unmatched? token
    PAIRS[@stack.pop] != token
  end

  def escape token
    write_buffer token
    @escaped = !@escaped
  end

  def begin_pair token
    @stack << token
    @color_stack << @colors.next
    write_color @color_stack.last, token
    flush_buffer
  end

  def end_pair token
    write_color @color_stack.pop, token
    flush_buffer
  end

  def flush_buffer
    @output << @buffer
    @buffer = ""
  end

  def write_color color, token
    @buffer << color << token << WHITE
  end

  def write_buffer token
    @buffer << token
  end
end

if __FILE__ == $0
  $stdout.puts Parens.new.rainbow($stdin) || "Invalid Parens!"
end

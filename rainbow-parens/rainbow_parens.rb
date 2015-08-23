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
      if @escaped && !ESCAPE.include?(token)
        @buffer << token
        next
      end

      case token
      when *ESCAPE
        @buffer << token
        @escaped = !@escaped
      when *PAIRS.keys
        @stack << token
        @color_stack << @colors.next
        @output << @buffer << @color_stack.last << token << WHITE
        @buffer = ""
      when *PAIRS.values
        if PAIRS[@stack.pop] != token
          return false
        end
        @output << @buffer << @color_stack.pop << token << WHITE
        @buffer = ""
      else
        @buffer << token
      end
    end
    return false unless @stack.empty?
    @output
  end

  def valid? text
    !!rainbow(text)
  end
end

if __FILE__ == $0
  $stdout.puts Parens.new.rainbow($stdin) || "Invalid Parens!"
end

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

  def self.rainbow text
    output = ""
    stack = []
    color_stack = []
    colors = COLORS.values.cycle
    buffer = ""
    text.each_char do |token|
      case token
      when *PAIRS.keys
        stack << token
        color_stack << colors.next
        output << buffer << color_stack.last << token << WHITE
        buffer = ""
      when *PAIRS.values
        if PAIRS[stack.pop] != token
          return false
        end
        output << buffer << color_stack.pop << token << WHITE
        buffer = ""
      else
        buffer << token
      end
    end
    output
  end

  def self.valid? text
    !!rainbow(text)
  end
end

if __FILE__ == $0
  $stdout.puts Parens.rainbow($stdin) || "Error: Invalid!"
end

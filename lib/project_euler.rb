class ProjectEuler
  attr_reader :problems

  PROBLEMS_PER_PAGE = 9

  def initialize(problems)
    @problems = problems
    @page = 1
  end

  def show_menu
    PROBLEMS_PER_PAGE.times do |i|
      problem = @problems.keys[index(i)]
      description = @problems[problem]
      puts "#{i+1}. #{description}" if not problem.nil?
    end
    puts "n. Next Page" if not is_last_page?
    puts "p. Previous Page" if not is_first_page?
  end

  def get_command
    command = gets.chomp
    if command == 'n' and not is_last_page? then @page += 1; return; end
    if command == 'p' and not is_first_page? then @page -= 1; return; end
    if command =~ /\d/
      problem = @problems.keys[index(command.to_i - 1)]
      if not problem.nil?
        puts "Result: " + eval("#{problem}.new.run").inspect
        return
      end
    end
    puts "'#{command}' is an invalid command or option. Please try again."
  end

  private
    
    def index(offset) 
      (@page - 1) * PROBLEMS_PER_PAGE + offset
    end

    def is_last_page?
      @problems.count <= (@page * PROBLEMS_PER_PAGE)
    end

    def is_first_page?
      @page == 1
    end
end

if $0 == __FILE__
  $: << './lib'
  problems = {}
  File.open('problems','r') do |file|
    file.each_line do |line|
      line.match /^(\w+)\s+(.*)$/
      problems[$1] = $2
      require $1.downcase.gsub(/([a-z])(\d)/i,'\1_\2')
    end
  end

  pe = ProjectEuler.new(problems)
  loop do
    pe.show_menu
    pe.get_command
  end
end

# Exercise 5 Part 1 (Exception Handling)

class MentalState
    def auditable?
      # true if the external service is online, otherwise false
    end
    def auditable?(no_mental_state)
      #do nothing :)
    end
    def audit!
      # Could fail if external service is offline
    end
    def do_work
      # Amazing stuff...
    end
  end
  
  def audit_sanity(bedtime_mental_state)
    if bedtime_mental_state.auditable?
      if bedtime_mental_state.audit!.ok?
        MorningMentalState.new(:ok)
      else 
        MorningMentalState.new(:not_ok)
      end
    end
  end

  begin
  new_state = audit_sanity(bedtime_mental_state)
  rescue NoValidMentalState
    puts ("No valid bedtime mental state")
  end
    
  
  
  
  
  
  # Exercise 5 Part 2 (Don't Return Null / Null Object Pattern)
  
  class BedtimeMentalState < MentalState ; end
  
  class MorningMentalState < MentalState ; end
  
  def audit_sanity(bedtime_mental_state)
    if bedtime_mental_state.auditable?
      if bedtime_mental_state.audit!.ok?
        MorningMentalState.new(:ok)
      else 
        MorningMentalState.new(:not_ok)
      end
    end
  end

  begin
  new_state = audit_sanity(bedtime_mental_state)
  rescue NoValidMentalState
    puts ("No valid bedtime mental state")
  end
  new_state.do_work
  
  
  
  
  # Exercise 5 Part 3 (Wrapping APIs)
  
  require 'candy_service'
  
  
  machine = my_new_machine()
  machine.prepare
  
  def my_new_machine(void):
    CandyMachine.new
  
  def get_machine_status(my_machine)
    my_machine.make  
  
  def start_machine(my_machine)
    my_machine.start 

  if get_machine_status(machine)
    start_machine(machine)
  else
    puts "sadness"
  end
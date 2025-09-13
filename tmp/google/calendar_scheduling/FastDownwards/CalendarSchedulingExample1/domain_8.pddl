(define (domain meeting_schedule_fixed)
  (:requirements :strips :typing :multi-agent)
  
  (:types agent time)
  
  (:predicates
    (available ?agent - agent ?time - time)
    (meeting_scheduled)
    (attending ?agent - agent)
    (not_after_time ?agent - agent ?time - time)
  )
  
  (:action raymond_attend
    :parameters (?time - time)
    :precondition (available raymond ?time)
    :effect (attending raymond)
  )
  
  (:action billy_attend
    :parameters (?time - time)
    :precondition (and (available billy ?time) (not_after_time billy ?time))
    :effect (attending billy)
  )
  
  (:action donald_attend
    :parameters (?time - time)
    :precondition (available donald ?time)
    :effect (attending donald)
  )
  
  (:action finalize_meeting
    :parameters ()
    :precondition (and 
                    (attending raymond)
                    (attending billy)
                    (attending donald)
                  )
    :effect (meeting_scheduled)
  )
)
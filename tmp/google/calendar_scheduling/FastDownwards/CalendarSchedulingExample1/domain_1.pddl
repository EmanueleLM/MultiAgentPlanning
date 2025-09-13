(define (domain meeting_schedule)
  (:requirements :strips :multi-agent)
  
  (:predicates
    (available ?agent ?time)
    (meeting_scheduled ?time)
    (attending ?agent ?time)
  )

  (:action raymond_attend
    :parameters (?time)
    :precondition (available raymond ?time)
    :effect (attending raymond ?time)
  )
  
  (:action billy_attend
    :parameters (?time)
    :precondition (available billy ?time)
    :effect (attending billy ?time)
  )

  (:action donald_attend
    :parameters (?time)
    :precondition (available donald ?time)
    :effect (attending donald ?time)
  )

  (:action finalize_meeting
    :parameters (?time)
    :precondition (and 
                    (attending raymond ?time)
                    (attending billy ?time)
                    (attending donald ?time)
                  )
    :effect (meeting_scheduled ?time)
  )
)
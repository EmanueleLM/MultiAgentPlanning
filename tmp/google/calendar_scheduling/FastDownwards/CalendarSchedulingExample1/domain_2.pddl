(define (domain meeting_schedule)
  (:requirements :strips :multi-agent :existential-preconditions)

  (:predicates
    (available ?agent ?time)
    (meeting_scheduled)
    (attending ?agent)
  )

  (:action raymond_attend
    :parameters (?time)
    :precondition (available raymond ?time)
    :effect (attending raymond)
  )
  
  (:action billy_attend
    :parameters (?time)
    :precondition (and (available billy ?time) (not (attending billy))) 
    :effect (attending billy)
  )

  (:action donald_attend
    :parameters (?time)
    :precondition (available donald ?time)
    :effect (attending donald)
  )

  (:action finalize_meeting
    :parameters (?time)
    :precondition (and 
                    (attending raymond)
                    (attending billy)
                    (attending donald)
                  )
    :effect (meeting_scheduled)
  )
)
(define (domain meeting_schedule)
  (:requirements :strips :multi-agent)

  (:predicates
    (available ?agent ?time)
    (prefers ?agent ?preference)
    (meeting_scheduled)
    (attending ?agent)
    (not_after_15 ?agent ?time)
  )

  (:action raymond_attend
    :parameters (?time)
    :precondition (available raymond ?time)
    :effect (attending raymond)
  )
  
  (:action billy_attend
    :parameters (?time)
    :precondition (and (available billy ?time) (not_after_15 billy ?time) (not (attending billy)))
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
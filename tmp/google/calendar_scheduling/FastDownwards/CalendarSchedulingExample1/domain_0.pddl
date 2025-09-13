(define (domain meeting_schedule)
  (:requirements :strips :multi-agent)
  
  (:predicates
    (available raymond ?time)
    (available billy ?time)
    (available donald ?time)
    (meeting_scheduled ?time)
  )

  (:action raymond_attend
    :parameters (?time)
    :precondition (available raymond ?time)
    :effect (meeting_scheduled ?time)
  )
  
  (:action billy_attend
    :parameters (?time)
    :precondition (available billy ?time)
    :effect (meeting_scheduled ?time)
  )

  (:action donald_attend
    :parameters (?time)
    :precondition (available donald ?time)
    :effect (meeting_scheduled ?time)
  )

  (:action finalize_meeting
    :parameters (?time)
    :precondition (and 
                    (meeting_scheduled ?time)
                    (meeting_scheduled ?time)
                    (meeting_scheduled ?time)
                  )
    :effect (meeting_scheduled ?time)
  )

)
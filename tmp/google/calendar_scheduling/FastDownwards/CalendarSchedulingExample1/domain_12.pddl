(define (domain meeting_schedule_fixed_fd)
  (:requirements :strips :typing :equality)

  (:types agent time)

  (:predicates
    (available ?agent - agent ?time - time)
    (meeting_scheduled)
    (attending ?agent - agent)
    (acceptable_time ?agent - agent ?time - time)
  )

  (:action raymond_attend
    :parameters (?time - time)
    :precondition (available raymond ?time)
    :effect (attending raymond)
  )

  (:action billy_attend
    :parameters (?time - time)
    :precondition (and (available billy ?time) 
                       (acceptable_time billy ?time))
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
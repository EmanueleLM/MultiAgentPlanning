(define (domain schedule-meeting)
  (:requirements :strips :negative-preconditions :typing)

  (:types time agent)

  (:predicates
    (possible-time ?time - time)
    (preferred ?agent - agent ?time - time)
    (common-meeting-time ?time - time)
  )

  (:action set-preference
    :parameters (?agent - agent ?time - time)
    :precondition (and (possible-time ?time) (not (preferred ?agent ?time)))
    :effect (preferred ?agent ?time))

  (:action find-common-time
    :parameters (?time - time)
    :precondition (and
                    (preferred raymond ?time)
                    (preferred billy ?time)
                    (preferred donald ?time))
    :effect (common-meeting-time ?time))
)
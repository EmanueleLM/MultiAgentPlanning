(define (domain schedule-meeting)
  (:requirements :strips :adl :typing)

  (:types time agent)

  (:constants raymond billy donald - agent)

  (:predicates
    (possible-time ?time - time)
    (blocked ?agent - agent ?time - time)
    (preferred-billy ?time - time)
    (common-meeting-time ?time - time)
  )

  (:action block-time
    :parameters (?agent - agent ?time - time)
    :precondition (possible-time ?time)
    :effect (blocked ?agent ?time))

  (:action find-common-time
    :parameters (?time - time)
    :precondition (and
                    (not (blocked raymond ?time))
                    (preferred-billy ?time)
                    (not (blocked donald ?time)))
    :effect (common-meeting-time ?time))
)
(define (domain schedule-meeting)
  (:requirements :strips :adl :typing)

  (:types time agent)

  (:constants raymond billy donald - agent)

  (:predicates
    (possible-time ?time - time)
    (blocked ?agent - agent ?time - time)
    (avoid-preference-billy ?time - time)
    (common-meeting-time ?time - time)
    (meeting-scheduled)
  )

  (:action block-time
    :parameters (?agent - agent ?time - time)
    :precondition (possible-time ?time)
    :effect (blocked ?agent ?time))

  (:action find-common-time
    :parameters (?time - time)
    :precondition (and
                    (not (blocked raymond ?time))
                    (not (blocked billy ?time))
                    (not (avoid-preference-billy ?time))
                    (not (blocked donald ?time)))
    :effect (common-meeting-time ?time))

  (:action finalize-meeting
    :parameters (?time - time)
    :precondition (common-meeting-time ?time)
    :effect (meeting-scheduled))
)
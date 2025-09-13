(define (domain schedule-meeting)
  (:requirements :strips :negative-preconditions :typing)

  (:types time)

  (:predicates
    (possible-time ?time - time)
    (raymond-preferred ?time - time)
    (billy-preferred ?time - time)
    (donald-preferred ?time - time)
    (common-meeting-time ?time - time)
  )

  (:action raymond-prefer
    :parameters (?time - time)
    :precondition (and (possible-time ?time) (not (raymond-preferred ?time)))
    :effect (raymond-preferred ?time))

  (:action billy-prefer
    :parameters (?time - time)
    :precondition (and (possible-time ?time) (not (billy-preferred ?time)))
    :effect (billy-preferred ?time))

  (:action donald-prefer
    :parameters (?time - time)
    :precondition (and (possible-time ?time) (not (donald-preferred ?time)))
    :effect (donald-preferred ?time))

  (:action find-common-time
    :parameters (?time - time)
    :precondition (and
                    (raymond-preferred ?time)
                    (billy-preferred ?time)
                    (donald-preferred ?time))
    :effect (common-meeting-time ?time))
)
(define (domain sf_meetings_classical_converted)
  (:requirements :typing :strips :adl :negative-preconditions :action-costs)
  (:types agent location time)

  (:predicates
    (at ?a - agent ?l - location)
    (met ?x - agent ?y - agent)
    (meeting-possible)
    (finished)
    (current-time ?t - time)
    (next1 ?t - time ?t2 - time)
    (next11 ?t - time ?t2 - time)
    (next13 ?t - time ?t2 - time)
    (next105 ?t - time ?t2 - time)
    (in-transit-traveler-ggp ?t2 - time)
    (in-transit-traveler-castro ?t2 - time)
    (in-meeting)
    (planned-meeting ?t2 - time)
    (available-jeffrey ?t - time)
  )

  (:action tick
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next1 ?t ?t2))
    :effect (and (not (current-time ?t)) (current-time ?t2))
  )

  (:action begin-travel-traveler-castro-to-ggp
    :parameters (?t - time ?t2 - time)
    :precondition (and
                   (at traveler the_castro)
                   (current-time ?t)
                   (next11 ?t ?t2)
                   (not (in-meeting))
                 )
    :effect (and
              (not (at traveler the_castro))
              (in-transit-traveler-ggp ?t2)
            )
  )

  (:action finish-travel-traveler-ggp
    :parameters (?t2 - time)
    :precondition (and (in-transit-traveler-ggp ?t2) (current-time ?t2))
    :effect (and
              (not (in-transit-traveler-ggp ?t2))
              (at traveler golden_gate_park)
            )
  )

  (:action begin-travel-traveler-ggp-to-castro
    :parameters (?t - time ?t2 - time)
    :precondition (and
                   (at traveler golden_gate_park)
                   (current-time ?t)
                   (next13 ?t ?t2)
                   (not (in-meeting))
                 )
    :effect (and
              (not (at traveler golden_gate_park))
              (in-transit-traveler-castro ?t2)
            )
  )

  (:action finish-travel-traveler-castro
    :parameters (?t2 - time)
    :precondition (and (in-transit-traveler-castro ?t2) (current-time ?t2))
    :effect (and
              (not (in-transit-traveler-castro ?t2))
              (at traveler the_castro)
            )
  )

  (:action begin-meeting
    :parameters (?t - time ?t2 - time)
    :precondition (and
                   (at traveler golden_gate_park)
                   (at jeffrey golden_gate_park)
                   (not (met traveler jeffrey))
                   (not (in-meeting))
                   (current-time ?t)
                   (next105 ?t ?t2)
                   (available-jeffrey ?t)
                   (available-jeffrey ?t2)
                 )
    :effect (and
              (in-meeting)
              (planned-meeting ?t2)
            )
  )

  (:action finish-meeting
    :parameters (?t2 - time)
    :precondition (and (in-meeting) (planned-meeting ?t2) (current-time ?t2))
    :effect (and
              (not (in-meeting))
              (not (planned-meeting ?t2))
              (met traveler jeffrey)
            )
  )

  (:action finish-with-meeting
    :parameters ()
    :precondition (met traveler jeffrey)
    :effect (finished)
    :cost 0
  )

  (:action finish-without-meeting
    :parameters ()
    :precondition (not (met traveler jeffrey))
    :effect (finished)
    :cost 1
  )
)
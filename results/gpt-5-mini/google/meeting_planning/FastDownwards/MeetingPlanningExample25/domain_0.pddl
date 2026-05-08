(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location time)

  (:predicates
    (at ?p - agent ?loc - location ?t - time)
    (travel-edge ?t1 - time ?t2 - time)        ; explicit 23-minute travel edges
    (after ?t1 - time ?t2 - time)              ; t2 is strictly after t1 in the relevant discrete set
    (meeting-allowed ?start - time ?end - time) ; pairs satisfying ">=105 minutes" and within David's window
    (meeting-done)                              ; goal flag: meeting with David completed
  )

  ;; Wait / remain at same location until the next relevant time
  (:action wait
    :parameters (?who - agent ?loc - location ?t1 - time ?t2 - time)
    :precondition (and (at ?who ?loc ?t1) (after ?t1 ?t2))
    :effect (and (at ?who ?loc ?t2) (not (at ?who ?loc ?t1)))
  )

  ;; Travel between locations when an explicit 23-minute travel-edge is defined between the two times
  (:action travel
    :parameters (?who - agent ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at ?who ?from ?t1) (travel-edge ?t1 ?t2))
    :effect (and (at ?who ?to ?t2) (not (at ?who ?from ?t1)))
  )

  ;; Meeting action: enforces that both traveler and David are at Chinatown at the meeting start and at the meeting end,
  ;; and that the chosen (start,end) pair is pre-declared as meeting-allowed (>=105 minutes and within David's window).
  ;; This encodes continuity by requiring presence at both endpoints of the block.
  (:action meet-with-david
    :parameters (?start - time ?end - time)
    :precondition (and
                   (at traveler Chinatown ?start)
                   (at traveler Chinatown ?end)
                   (at david Chinatown ?start)
                   (at david Chinatown ?end)
                   (meeting-allowed ?start ?end)
                  )
    :effect (and (meeting-done))
  )
)
; SOLUTION:
(define (domain meet-andrew)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time)
  (:predicates
    (at ?l - location)
    (now ?t - time)
    (met-andrew)
    (succ ?t1 - time ?t2 - time)          ; immediate successor (t+1)
    (delta22 ?t1 - time ?t2 - time)       ; t2 = t1 + 22
    (delta24 ?t1 - time ?t2 - time)       ; t2 = t1 + 24
    (delta105 ?t1 - time ?t2 - time)      ; t2 = t1 + 105 (meeting duration)
    (valid_meeting_start ?t - time)       ; t in [675,930] inclusive
  )

  ; Wait one minute while staying at the same location
  (:action wait_one_min
    :parameters (?t1 - time ?t2 - time ?loc - location)
    :precondition (and (now ?t1) (succ ?t1 ?t2) (at ?loc))
    :effect (and
              (not (now ?t1)) (now ?t2)
            )
  )

  ; Travel from Presidio to Union Square: atomic 22-minute move
  (:action travel_presidio_union
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (now ?t1) (delta22 ?t1 ?t2) (at presidio))
    :effect (and
              (not (now ?t1)) (now ?t2)
              (not (at presidio)) (at union_square)
            )
  )

  ; Travel from Union Square to Presidio: atomic 24-minute move
  (:action travel_union_presidio
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (now ?t1) (delta24 ?t1 ?t2) (at union_square))
    :effect (and
              (not (now ?t1)) (now ?t2)
              (not (at union_square)) (at presidio)
            )
  )

  ; Single contiguous meeting action of exactly 105 minutes.
  ; Requires starting time to be a valid meeting start (Andrew available and meeting finishes by 1035).
  (:action meet_andrew_105
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (now ?t1) (delta105 ?t1 ?t2) (at union_square) (valid_meeting_start ?t1))
    :effect (and
              (not (now ?t1)) (now ?t2)
              (met-andrew)
            )
  )
)
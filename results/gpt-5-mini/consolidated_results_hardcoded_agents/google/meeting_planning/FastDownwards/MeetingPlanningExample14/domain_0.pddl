(define (domain meeting-schedule)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time)

  (:predicates
    (at ?loc - location ?t - time)                       ; agent at location at timepoint
    (edge ?from - location ?to - location)               ; travel connectivity (directional)
    (dur-wait ?t1 - time ?t2 - time)                     ; a discrete time interval used for waiting (exact length encoded by which pair is provided)
    (dur-move11 ?t1 - time ?t2 - time)                   ; a 11-minute travel interval (Nob Hill -> Marina District)
    (dur-move12 ?t1 - time ?t2 - time)                   ; a 12-minute travel interval (Marina District -> Nob Hill)
    (dur-meet ?t1 - time ?t2 - time)                     ; a 120-minute meeting interval
    (mary-available ?t1 - time ?t2 - time)               ; Mary is available during this exact interval
    (met-mary)                                           ; meeting-with-Mary completed (atomic fact)
  )

  ;; Wait at the same location for an interval that matches a dur-wait fact.
  (:action wait
    :parameters (?loc - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?loc ?t1)
      (dur-wait ?t1 ?t2)
    )
    :effect (and
      (not (at ?loc ?t1))
      (at ?loc ?t2)
    )
  )

  ;; Move from Nob Hill to Marina District in an 11-minute interval (must match dur-move11).
  (:action move-nobhill-to-marina
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at nobhill ?t1)
      (edge nobhill marina)
      (dur-move11 ?t1 ?t2)
    )
    :effect (and
      (not (at nobhill ?t1))
      (at marina ?t2)
    )
  )

  ;; Move from Marina District to Nob Hill in a 12-minute interval (must match dur-move12).
  (:action move-marina-to-nobhill
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at marina ?t1)
      (edge marina nobhill)
      (dur-move12 ?t1 ?t2)
    )
    :effect (and
      (not (at marina ?t1))
      (at nobhill ?t2)
    )
  )

  ;; Meet Mary at Marina District for an interval that matches dur-meet AND is within Mary's availability.
  ;; This action records completion by asserting (met-mary) and advances time to the meeting end.
  (:action meet-mary-at-marina
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at marina ?t1)
      (dur-meet ?t1 ?t2)
      (mary-available ?t1 ?t2)
    )
    :effect (and
      (not (at marina ?t1))
      (at marina ?t2)
      (met-mary)
    )
  )
)
(define (domain meeting-schedule)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time)

  (:predicates
    (at ?loc - location ?t - time)          ; agent at a location at a specific timepoint
    (edge ?from - location ?to - location)  ; directed travel connectivity (graph)
    (dur-wait ?t1 - time ?t2 - time)        ; waiting interval (arbitrary interval)
    (dur-move11 ?t1 - time ?t2 - time)      ; 11-minute travel interval (Nob Hill -> Marina)
    (dur-move12 ?t1 - time ?t2 - time)      ; 12-minute travel interval (Marina -> Nob Hill)
    (dur-meet ?t1 - time ?t2 - time)        ; 120-minute meeting interval
    (mary-available ?t1 - time ?t2 - time)  ; Mary is available exactly for this interval
    (met-mary)                              ; meeting-with-Mary completed
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

  ;; Move from Nob Hill to Marina District using an 11-minute dur-move11 interval.
  (:action move-nobhill-to-marina
    :parameters (?t1 - time ?t2 - time ?from - location ?to - location)
    :precondition (and
      (at ?from ?t1)
      (edge ?from ?to)
      ;; enforce that this action is used only for Nob Hill -> Marina with 11-minute duration
      (dur-move11 ?t1 ?t2)
      ;; type-checking by naming: we will use objects nobhill and marina in the problem init
    )
    :effect (and
      (not (at ?from ?t1))
      (at ?to ?t2)
    )
  )

  ;; Move from Marina District to Nob Hill using a 12-minute dur-move12 interval.
  (:action move-marina-to-nobhill
    :parameters (?t1 - time ?t2 - time ?from - location ?to - location)
    :precondition (and
      (at ?from ?t1)
      (edge ?from ?to)
      (dur-move12 ?t1 ?t2)
    )
    :effect (and
      (not (at ?from ?t1))
      (at ?to ?t2)
    )
  )

  ;; Meet Mary at Marina District for an interval matching dur-meet AND within Mary's availability.
  (:action meet-mary-at-marina
    :parameters (?t1 - time ?t2 - time ?loc - location)
    :precondition (and
      (at ?loc ?t1)
      (dur-meet ?t1 ?t2)
      (mary-available ?t1 ?t2)
      ;; ensure meeting occurs at marina by using the marina object in the problem init
    )
    :effect (and
      (not (at ?loc ?t1))
      (at ?loc ?t2)
      (met-mary)
    )
  )
)
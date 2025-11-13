(define (domain MeetingPlanningExample24)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    location person time
  )
  (:predicates
    ; State
    (at ?l - location)
    (current-time ?t - time)
    (met ?p - person)

    ; Calendars and meeting spots
    (meeting-spot ?p - person ?l - location)
    (start-ok ?p - person ?t - time)

    ; Directed travel edges by duration
    (travel17 ?from ?to - location)
    (travel18 ?from ?to - location)

    ; Time arithmetic relations
    (plus1 ?t1 ?t2 - time)
    (plus17 ?t1 ?t2 - time)
    (plus18 ?t1 ?t2 - time)
    (plus30 ?t1 ?t2 - time)
  )
  (:functions (total-cost))

  ; Wait exactly 1 minute at the current location
  (:action wait-1
    :parameters (?t ?t2 - time ?l - location)
    :precondition (and
      (current-time ?t)
      (plus1 ?t ?t2)
      (at ?l)
    )
    :effect (and
      (not (current-time ?t))
      (current-time ?t2)
      (increase (total-cost) 1)
    )
  )

  ; Move along edges that take 17 minutes
  (:action move-17
    :parameters (?from ?to - location ?t ?t2 - time)
    :precondition (and
      (current-time ?t)
      (at ?from)
      (travel17 ?from ?to)
      (plus17 ?t ?t2)
    )
    :effect (and
      (not (current-time ?t))
      (current-time ?t2)
      (not (at ?from))
      (at ?to)
      (increase (total-cost) 17)
    )
  )

  ; Move along edges that take 18 minutes
  (:action move-18
    :parameters (?from ?to - location ?t ?t2 - time)
    :precondition (and
      (current-time ?t)
      (at ?from)
      (travel18 ?from ?to)
      (plus18 ?t ?t2)
    )
    :effect (and
      (not (current-time ?t))
      (current-time ?t2)
      (not (at ?from))
      (at ?to)
      (increase (total-cost) 18)
    )
  )

  ; Meet a friend for at least 30 minutes (encoded as exactly 30 minutes here,
  ; which satisfies the "at least 30" requirement)
  (:action meet-30
    :parameters (?p - person ?l - location ?t ?t2 - time)
    :precondition (and
      (current-time ?t)
      (plus30 ?t ?t2)
      (meeting-spot ?p ?l)
      (at ?l)
      (start-ok ?p ?t)
      (not (met ?p))
    )
    :effect (and
      (not (current-time ?t))
      (current-time ?t2)
      (met ?p)
      (increase (total-cost) 30)
    )
  )
)
(define (domain trip-orchestration)
  (:requirements :strips :typing :negative-preconditions :adl :action-costs)
  (:types agent city)

  (:predicates
    (traveler-agent ?a - agent)
    (flights-agent ?a - agent)
    (at ?a - agent ?c - city)
    (direct ?c1 - city ?c2 - city)
    (flight-available ?c1 - city ?c2 - city)
    (met-friends)

    (day-0) (day-1) (day-2) (day-3) (day-4) (day-5) (day-6) (day-7) (day-8) (day-9)

    (remaining-0) (remaining-1) (remaining-2) (remaining-3) (remaining-4) (remaining-5) (remaining-6) (remaining-7) (remaining-8) (remaining-9)

    (need-brussels-0) (need-brussels-1) (need-brussels-2)
    (need-valencia-0) (need-valencia-1) (need-valencia-2) (need-valencia-3)
    (need-nice-0) (need-nice-1) (need-nice-2) (need-nice-3) (need-nice-4) (need-nice-5) (need-nice-6)
  )

  (:functions (total-cost))

  (:action flights_info-provide
    :parameters (?fa - agent ?from - city ?to - city)
    :precondition (and (flights-agent ?fa) (direct ?from ?to))
    :effect (and
      (flight-available ?from ?to)
      (flight-available ?to ?from)
      (increase (total-cost) 0)
    )
  )

  (:action traveler-fly
    :parameters (?ta - agent ?from - city ?to - city)
    :precondition (and (traveler-agent ?ta) (at ?ta ?from) (flight-available ?from ?to))
    :effect (and
      (not (at ?ta ?from))
      (at ?ta ?to)
      (increase (total-cost) 1)
    )
  )

  ;; Traveler stays in Brussels: need-brussels 2->1 and 1->0, for remaining 9 down to 1 (day increments accordingly).
  (:action traveler-stay-brussels-n2-r9-d0
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta brussels) (need-brussels-2) (remaining-9) (day-0))
    :effect (and (not (need-brussels-2)) (need-brussels-1) (not (remaining-9)) (remaining-8) (not (day-0)) (day-1) (increase (total-cost) 1))
  )
  (:action traveler-stay-brussels-n2-r8-d1
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta brussels) (need-brussels-2) (remaining-8) (day-1))
    :effect (and (not (need-brussels-2)) (need-brussels-1) (not (remaining-8)) (remaining-7) (not (day-1)) (day-2) (increase (total-cost) 1))
  )
  (:action traveler-stay-brussels-n2-r7-d2
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta brussels) (need-brussels-2) (remaining-7) (day-2))
    :effect (and (not (need-brussels-2)) (need-brussels-1) (not (remaining-7)) (remaining-6) (not (day-2)) (day-3) (increase (total-cost) 1))
  )
  (:action traveler-stay-brussels-n2-r6-d3
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta brussels) (need-brussels-2) (remaining-6) (day-3))
    :effect (and (not (need-brussels-2)) (need-brussels-1) (not (remaining-6)) (remaining-5) (not (day-3)) (day-4) (increase (total-cost) 1))
  )
  (:action traveler-stay-brussels-n2-r5-d4
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta brussels) (need-brussels-2) (remaining-5) (day-4))
    :effect (and (not (need-brussels-2)) (need-brussels-1) (not (remaining-5)) (remaining-4) (not (day-4)) (day-5) (increase (total-cost) 1))
  )
  (:action traveler-stay-brussels-n2-r4-d5
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta brussels) (need-brussels-2) (remaining-4) (day-5))
    :effect (and (not (need-brussels-2)) (need-brussels-1) (not (remaining-4)) (remaining-3) (not (day-5)) (day-6) (increase (total-cost) 1))
  )
  (:action traveler-stay-brussels-n2-r3-d6
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta brussels) (need-brussels-2) (remaining-3) (day-6))
    :effect (and (not (need-brussels-2)) (need-brussels-1) (not (remaining-3)) (remaining-2) (not (day-6)) (day-7) (increase (total-cost) 1))
  )
  (:action traveler-stay-brussels-n2-r2-d7
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta brussels) (need-brussels-2) (remaining-2) (day-7))
    :effect (and (not (need-brussels-2)) (need-brussels-1) (not (remaining-2)) (remaining-1) (not (day-7)) (day-8) (increase (total-cost) 1))
  )
  (:action traveler-stay-brussels-n2-r1-d8
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta brussels) (need-brussels-2) (remaining-1) (day-8))
    :effect (and (not (need-brussels-2)) (need-brussels-1) (not (remaining-1)) (remaining-0) (not (day-8)) (day-9) (increase (total-cost) 1))
  )

  (:action traveler-stay-brussels-n1-r9-d0
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta brussels) (need-brussels-1) (remaining-9) (day-0))
    :effect (and (not (need-brussels-1)) (need-brussels-0) (not (remaining-9)) (remaining-8) (not (day-0)) (day-1) (increase (total-cost) 1))
  )
  (:action traveler-stay-brussels-n1-r8-d1
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta brussels) (need-brussels-1) (remaining-8) (day-1))
    :effect (and (not (need-brussels-1)) (need-brussels-0) (not (remaining-8)) (remaining-7) (not (day-1)) (day-2) (increase (total-cost) 1))
  )
  (:action traveler-stay-brussels-n1-r7-d2
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta brussels) (need-brussels-1) (remaining-7) (day-2))
    :effect (and (not (need-brussels-1)) (need-brussels-0) (not (remaining-7)) (remaining-6) (not (day-2)) (day-3) (increase (total-cost) 1))
  )
  (:action traveler-stay-brussels-n1-r6-d3
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta brussels) (need-brussels-1) (remaining-6) (day-3))
    :effect (and (not (need-brussels-1)) (need-brussels-0) (not (remaining-6)) (remaining-5) (not (day-3)) (day-4) (increase (total-cost) 1))
  )
  (:action traveler-stay-brussels-n1-r5-d4
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta brussels) (need-brussels-1) (remaining-5) (day-4))
    :effect (and (not (need-brussels-1)) (need-brussels-0) (not (remaining-5)) (remaining-4) (not (day-4)) (day-5) (increase (total-cost) 1))
  )
  (:action traveler-stay-brussels-n1-r4-d5
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta brussels) (need-brussels-1) (remaining-4) (day-5))
    :effect (and (not (need-brussels-1)) (need-brussels-0) (not (remaining-4)) (remaining-3) (not (day-5)) (day-6) (increase (total-cost) 1))
  )
  (:action traveler-stay-brussels-n1-r3-d6
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta brussels) (need-brussels-1) (remaining-3) (day-6))
    :effect (and (not (need-brussels-1)) (need-brussels-0) (not (remaining-3)) (remaining-2) (not (day-6)) (day-7) (increase (total-cost) 1))
  )
  (:action traveler-stay-brussels-n1-r2-d7
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta brussels) (need-brussels-1) (remaining-2) (day-7))
    :effect (and (not (need-brussels-1)) (need-brussels-0) (not (remaining-2)) (remaining-1) (not (day-7)) (day-8) (increase (total-cost) 1))
  )
  (:action traveler-stay-brussels-n1-r1-d8
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta brussels) (need-brussels-1) (remaining-1) (day-8))
    :effect (and (not (need-brussels-1)) (need-brussels-0) (not (remaining-1)) (remaining-0) (not (day-8)) (day-9) (increase (total-cost) 1))
  )

  ;; Traveler stays in Valencia: need-valencia 3->2,2->1,1->0
  (:action traveler-stay-valencia-n3-r9-d0
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta valencia) (need-valencia-3) (remaining-9) (day-0))
    :effect (and (not (need-valencia-3)) (need-valencia-2) (not (remaining-9)) (remaining-8) (not (day-0)) (day-1) (increase (total-cost) 1))
  )
  (:action traveler-stay-valencia-n3-r8-d1
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta valencia) (need-valencia-3) (remaining-8) (day-1))
    :effect (and (not (need-valencia-3)) (need-valencia-2) (not (remaining-8)) (remaining-7) (not (day-1)) (day-2) (increase (total-cost) 1))
  )
  (:action traveler-stay-valencia-n3-r7-d2
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta valencia) (need-valencia-3) (remaining-7) (day-2))
    :effect (and (not (need-valencia-3)) (need-valencia-2) (not (remaining-7)) (remaining-6) (not (day-2)) (day-3) (increase (total-cost) 1))
  )
  (:action traveler-stay-valencia-n3-r6-d3
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta valencia) (need-valencia-3) (remaining-6) (day-3))
    :effect (and (not (need-valencia-3)) (need-valencia-2) (not (remaining-6)) (remaining-5) (not (day-3)) (day-4) (increase (total-cost) 1))
  )
  (:action traveler-stay-valencia-n3-r5-d4
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta valencia) (need-valencia-3) (remaining-5) (day-4))
    :effect (and (not (need-valencia-3)) (need-valencia-2) (not (remaining-5)) (remaining-4) (not (day-4)) (day-5) (increase (total-cost) 1))
  )
  (:action traveler-stay-valencia-n3-r4-d5
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta valencia) (need-valencia-3) (remaining-4) (day-5))
    :effect (and (not (need-valencia-3)) (need-valencia-2) (not (remaining-4)) (remaining-3) (not (day-5)) (day-6) (increase (total-cost) 1))
  )
  (:action traveler-stay-valencia-n3-r3-d6
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta valencia) (need-valencia-3) (remaining-3) (day-6))
    :effect (and (not (need-valencia-3)) (need-valencia-2) (not (remaining-3)) (remaining-2) (not (day-6)) (day-7) (increase (total-cost) 1))
  )
  (:action traveler-stay-valencia-n3-r2-d7
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta valencia) (need-valencia-3) (remaining-2) (day-7))
    :effect (and (not (need-valencia-3)) (need-valencia-2) (not (remaining-2)) (remaining-1) (not (day-7)) (day-8) (increase (total-cost) 1))
  )
  (:action traveler-stay-valencia-n3-r1-d8
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta valencia) (need-valencia-3) (remaining-1) (day-8))
    :effect (and (not (need-valencia-3)) (need-valencia-2) (not (remaining-1)) (remaining-0) (not (day-8)) (day-9) (increase (total-cost) 1))
  )

  (:action traveler-stay-valencia-n2-r9-d0
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta valencia) (need-valencia-2) (remaining-9) (day-0))
    :effect (and (not (need-valencia-2)) (need-valencia-1) (not (remaining-9)) (remaining-8) (not (day-0)) (day-1) (increase (total-cost) 1))
  )
  (:action traveler-stay-valencia-n2-r8-d1
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta valencia) (need-valencia-2) (remaining-8) (day-1))
    :effect (and (not (need-valencia-2)) (need-valencia-1) (not (remaining-8)) (remaining-7) (not (day-1)) (day-2) (increase (total-cost) 1))
  )
  (:action traveler-stay-valencia-n2-r7-d2
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta valencia) (need-valencia-2) (remaining-7) (day-2))
    :effect (and (not (need-valencia-2)) (need-valencia-1) (not (remaining-7)) (remaining-6) (not (day-2)) (day-3) (increase (total-cost) 1))
  )
  (:action traveler-stay-valencia-n2-r6-d3
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta valencia) (need-valencia-2) (remaining-6) (day-3))
    :effect (and (not (need-valencia-2)) (need-valencia-1) (not (remaining-6)) (remaining-5) (not (day-3)) (day-4) (increase (total-cost) 1))
  )
  (:action traveler-stay-valencia-n2-r5-d4
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta valencia) (need-valencia-2) (remaining-5) (day-4))
    :effect (and (not (need-valencia-2)) (need-valencia-1) (not (remaining-5)) (remaining-4) (not (day-4)) (day-5) (increase (total-cost) 1))
  )
  (:action traveler-stay-valencia-n2-r4-d5
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta valencia) (need-valencia-2) (remaining-4) (day-5))
    :effect (and (not (need-valencia-2)) (need-valencia-1) (not (remaining-4)) (remaining-3) (not (day-5)) (day-6) (increase (total-cost) 1))
  )
  (:action traveler-stay-valencia-n2-r3-d6
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta valencia) (need-valencia-2) (remaining-3) (day-6))
    :effect (and (not (need-valencia-2)) (need-valencia-1) (not (remaining-3)) (remaining-2) (not (day-6)) (day-7) (increase (total-cost) 1))
  )
  (:action traveler-stay-valencia-n2-r2-d7
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta valencia) (need-valencia-2) (remaining-2) (day-7))
    :effect (and (not (need-valencia-2)) (need-valencia-1) (not (remaining-2)) (remaining-1) (not (day-7)) (day-8) (increase (total-cost) 1))
  )
  (:action traveler-stay-valencia-n2-r1-d8
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta valencia) (need-valencia-2) (remaining-1) (day-8))
    :effect (and (not (need-valencia-2)) (need-valencia-1) (not (remaining-1)) (remaining-0) (not (day-8)) (day-9) (increase (total-cost) 1))
  )

  (:action traveler-stay-valencia-n1-r9-d0
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta valencia) (need-valencia-1) (remaining-9) (day-0))
    :effect (and (not (need-valencia-1)) (need-valencia-0) (not (remaining-9)) (remaining-8) (not (day-0)) (day-1) (increase (total-cost) 1))
  )
  (:action traveler-stay-valencia-n1-r8-d1
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta valencia) (need-valencia-1) (remaining-8) (day-1))
    :effect (and (not (need-valencia-1)) (need-valencia-0) (not (remaining-8)) (remaining-7) (not (day-1)) (day-2) (increase (total-cost) 1))
  )
  (:action traveler-stay-valencia-n1-r7-d2
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta valencia) (need-valencia-1) (remaining-7) (day-2))
    :effect (and (not (need-valencia-1)) (need-valencia-0) (not (remaining-7)) (remaining-6) (not (day-2)) (day-3) (increase (total-cost) 1))
  )
  (:action traveler-stay-valencia-n1-r6-d3
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta valencia) (need-valencia-1) (remaining-6) (day-3))
    :effect (and (not (need-valencia-1)) (need-valencia-0) (not (remaining-6)) (remaining-5) (not (day-3)) (day-4) (increase (total-cost) 1))
  )
  (:action traveler-stay-valencia-n1-r5-d4
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta valencia) (need-valencia-1) (remaining-5) (day-4))
    :effect (and (not (need-valencia-1)) (need-valencia-0) (not (remaining-5)) (remaining-4) (not (day-4)) (day-5) (increase (total-cost) 1))
  )
  (:action traveler-stay-valencia-n1-r4-d5
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta valencia) (need-valencia-1) (remaining-4) (day-5))
    :effect (and (not (need-valencia-1)) (need-valencia-0) (not (remaining-4)) (remaining-3) (not (day-5)) (day-6) (increase (total-cost) 1))
  )
  (:action traveler-stay-valencia-n1-r3-d6
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta valencia) (need-valencia-1) (remaining-3) (day-6))
    :effect (and (not (need-valencia-1)) (need-valencia-0) (not (remaining-3)) (remaining-2) (not (day-6)) (day-7) (increase (total-cost) 1))
  )
  (:action traveler-stay-valencia-n1-r2-d7
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta valencia) (need-valencia-1) (remaining-2) (day-7))
    :effect (and (not (need-valencia-1)) (need-valencia-0) (not (remaining-2)) (remaining-1) (not (day-7)) (day-8) (increase (total-cost) 1))
  )
  (:action traveler-stay-valencia-n1-r1-d8
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta valencia) (need-valencia-1) (remaining-1) (day-8))
    :effect (and (not (need-valencia-1)) (need-valencia-0) (not (remaining-1)) (remaining-0) (not (day-8)) (day-9) (increase (total-cost) 1))
  )

  ;; Traveler stays in Nice: need-nice 6->5->4->3->2->1->0
  (:action traveler-stay-nice-n6-r9-d0
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-6) (remaining-9) (day-0))
    :effect (and (not (need-nice-6)) (need-nice-5) (not (remaining-9)) (remaining-8) (not (day-0)) (day-1) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n6-r8-d1
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-6) (remaining-8) (day-1))
    :effect (and (not (need-nice-6)) (need-nice-5) (not (remaining-8)) (remaining-7) (not (day-1)) (day-2) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n6-r7-d2
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-6) (remaining-7) (day-2))
    :effect (and (not (need-nice-6)) (need-nice-5) (not (remaining-7)) (remaining-6) (not (day-2)) (day-3) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n6-r6-d3
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-6) (remaining-6) (day-3))
    :effect (and (not (need-nice-6)) (need-nice-5) (not (remaining-6)) (remaining-5) (not (day-3)) (day-4) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n6-r5-d4
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-6) (remaining-5) (day-4))
    :effect (and (not (need-nice-6)) (need-nice-5) (not (remaining-5)) (remaining-4) (not (day-4)) (day-5) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n6-r4-d5
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-6) (remaining-4) (day-5))
    :effect (and (not (need-nice-6)) (need-nice-5) (not (remaining-4)) (remaining-3) (not (day-5)) (day-6) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n6-r3-d6
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-6) (remaining-3) (day-6))
    :effect (and (not (need-nice-6)) (need-nice-5) (not (remaining-3)) (remaining-2) (not (day-6)) (day-7) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n6-r2-d7
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-6) (remaining-2) (day-7))
    :effect (and (not (need-nice-6)) (need-nice-5) (not (remaining-2)) (remaining-1) (not (day-7)) (day-8) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n6-r1-d8
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-6) (remaining-1) (day-8))
    :effect (and (not (need-nice-6)) (need-nice-5) (not (remaining-1)) (remaining-0) (not (day-8)) (day-9) (increase (total-cost) 1))
  )

  (:action traveler-stay-nice-n5-r9-d0
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-5) (remaining-9) (day-0))
    :effect (and (not (need-nice-5)) (need-nice-4) (not (remaining-9)) (remaining-8) (not (day-0)) (day-1) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n5-r8-d1
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-5) (remaining-8) (day-1))
    :effect (and (not (need-nice-5)) (need-nice-4) (not (remaining-8)) (remaining-7) (not (day-1)) (day-2) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n5-r7-d2
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-5) (remaining-7) (day-2))
    :effect (and (not (need-nice-5)) (need-nice-4) (not (remaining-7)) (remaining-6) (not (day-2)) (day-3) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n5-r6-d3
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-5) (remaining-6) (day-3))
    :effect (and (not (need-nice-5)) (need-nice-4) (not (remaining-6)) (remaining-5) (not (day-3)) (day-4) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n5-r5-d4
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-5) (remaining-5) (day-4))
    :effect (and (not (need-nice-5)) (need-nice-4) (not (remaining-5)) (remaining-4) (not (day-4)) (day-5) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n5-r4-d5
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-5) (remaining-4) (day-5))
    :effect (and (not (need-nice-5)) (need-nice-4) (not (remaining-4)) (remaining-3) (not (day-5)) (day-6) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n5-r3-d6
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-5) (remaining-3) (day-6))
    :effect (and (not (need-nice-5)) (need-nice-4) (not (remaining-3)) (remaining-2) (not (day-6)) (day-7) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n5-r2-d7
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-5) (remaining-2) (day-7))
    :effect (and (not (need-nice-5)) (need-nice-4) (not (remaining-2)) (remaining-1) (not (day-7)) (day-8) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n5-r1-d8
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-5) (remaining-1) (day-8))
    :effect (and (not (need-nice-5)) (need-nice-4) (not (remaining-1)) (remaining-0) (not (day-8)) (day-9) (increase (total-cost) 1))
  )

  (:action traveler-stay-nice-n4-r9-d0
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-4) (remaining-9) (day-0))
    :effect (and (not (need-nice-4)) (need-nice-3) (not (remaining-9)) (remaining-8) (not (day-0)) (day-1) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n4-r8-d1
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-4) (remaining-8) (day-1))
    :effect (and (not (need-nice-4)) (need-nice-3) (not (remaining-8)) (remaining-7) (not (day-1)) (day-2) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n4-r7-d2
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-4) (remaining-7) (day-2))
    :effect (and (not (need-nice-4)) (need-nice-3) (not (remaining-7)) (remaining-6) (not (day-2)) (day-3) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n4-r6-d3
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-4) (remaining-6) (day-3))
    :effect (and (not (need-nice-4)) (need-nice-3) (not (remaining-6)) (remaining-5) (not (day-3)) (day-4) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n4-r5-d4
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-4) (remaining-5) (day-4))
    :effect (and (not (need-nice-4)) (need-nice-3) (not (remaining-5)) (remaining-4) (not (day-4)) (day-5) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n4-r4-d5
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-4) (remaining-4) (day-5))
    :effect (and (not (need-nice-4)) (need-nice-3) (not (remaining-4)) (remaining-3) (not (day-5)) (day-6) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n4-r3-d6
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-4) (remaining-3) (day-6))
    :effect (and (not (need-nice-4)) (need-nice-3) (not (remaining-3)) (remaining-2) (not (day-6)) (day-7) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n4-r2-d7
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-4) (remaining-2) (day-7))
    :effect (and (not (need-nice-4)) (need-nice-3) (not (remaining-2)) (remaining-1) (not (day-7)) (day-8) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n4-r1-d8
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-4) (remaining-1) (day-8))
    :effect (and (not (need-nice-4)) (need-nice-3) (not (remaining-1)) (remaining-0) (not (day-8)) (day-9) (increase (total-cost) 1))
  )

  (:action traveler-stay-nice-n3-r9-d0
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-3) (remaining-9) (day-0))
    :effect (and (not (need-nice-3)) (need-nice-2) (not (remaining-9)) (remaining-8) (not (day-0)) (day-1) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n3-r8-d1
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-3) (remaining-8) (day-1))
    :effect (and (not (need-nice-3)) (need-nice-2) (not (remaining-8)) (remaining-7) (not (day-1)) (day-2) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n3-r7-d2
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-3) (remaining-7) (day-2))
    :effect (and (not (need-nice-3)) (need-nice-2) (not (remaining-7)) (remaining-6) (not (day-2)) (day-3) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n3-r6-d3
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-3) (remaining-6) (day-3))
    :effect (and (not (need-nice-3)) (need-nice-2) (not (remaining-6)) (remaining-5) (not (day-3)) (day-4) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n3-r5-d4
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-3) (remaining-5) (day-4))
    :effect (and (not (need-nice-3)) (need-nice-2) (not (remaining-5)) (remaining-4) (not (day-4)) (day-5) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n3-r4-d5
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-3) (remaining-4) (day-5))
    :effect (and (not (need-nice-3)) (need-nice-2) (not (remaining-4)) (remaining-3) (not (day-5)) (day-6) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n3-r3-d6
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-3) (remaining-3) (day-6))
    :effect (and (not (need-nice-3)) (need-nice-2) (not (remaining-3)) (remaining-2) (not (day-6)) (day-7) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n3-r2-d7
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-3) (remaining-2) (day-7))
    :effect (and (not (need-nice-3)) (need-nice-2) (not (remaining-2)) (remaining-1) (not (day-7)) (day-8) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n3-r1-d8
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-3) (remaining-1) (day-8))
    :effect (and (not (need-nice-3)) (need-nice-2) (not (remaining-1)) (remaining-0) (not (day-8)) (day-9) (increase (total-cost) 1))
  )

  (:action traveler-stay-nice-n2-r9-d0
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-2) (remaining-9) (day-0))
    :effect (and (not (need-nice-2)) (need-nice-1) (not (remaining-9)) (remaining-8) (not (day-0)) (day-1) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n2-r8-d1
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-2) (remaining-8) (day-1))
    :effect (and (not (need-nice-2)) (need-nice-1) (not (remaining-8)) (remaining-7) (not (day-1)) (day-2) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n2-r7-d2
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-2) (remaining-7) (day-2))
    :effect (and (not (need-nice-2)) (need-nice-1) (not (remaining-7)) (remaining-6) (not (day-2)) (day-3) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n2-r6-d3
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-2) (remaining-6) (day-3))
    :effect (and (not (need-nice-2)) (need-nice-1) (not (remaining-6)) (remaining-5) (not (day-3)) (day-4) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n2-r5-d4
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-2) (remaining-5) (day-4))
    :effect (and (not (need-nice-2)) (need-nice-1) (not (remaining-5)) (remaining-4) (not (day-4)) (day-5) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n2-r4-d5
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-2) (remaining-4) (day-5))
    :effect (and (not (need-nice-2)) (need-nice-1) (not (remaining-4)) (remaining-3) (not (day-5)) (day-6) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n2-r3-d6
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-2) (remaining-3) (day-6))
    :effect (and (not (need-nice-2)) (need-nice-1) (not (remaining-3)) (remaining-2) (not (day-6)) (day-7) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n2-r2-d7
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-2) (remaining-2) (day-7))
    :effect (and (not (need-nice-2)) (need-nice-1) (not (remaining-2)) (remaining-1) (not (day-7)) (day-8) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n2-r1-d8
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-2) (remaining-1) (day-8))
    :effect (and (not (need-nice-2)) (need-nice-1) (not (remaining-1)) (remaining-0) (not (day-8)) (day-9) (increase (total-cost) 1))
  )

  (:action traveler-stay-nice-n1-r9-d0
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-1) (remaining-9) (day-0))
    :effect (and (not (need-nice-1)) (need-nice-0) (not (remaining-9)) (remaining-8) (not (day-0)) (day-1) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n1-r8-d1
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-1) (remaining-8) (day-1))
    :effect (and (not (need-nice-1)) (need-nice-0) (not (remaining-8)) (remaining-7) (not (day-1)) (day-2) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n1-r7-d2
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-1) (remaining-7) (day-2))
    :effect (and (not (need-nice-1)) (need-nice-0) (not (remaining-7)) (remaining-6) (not (day-2)) (day-3) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n1-r6-d3
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-1) (remaining-6) (day-3))
    :effect (and (not (need-nice-1)) (need-nice-0) (not (remaining-6)) (remaining-5) (not (day-3)) (day-4) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n1-r5-d4
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-1) (remaining-5) (day-4))
    :effect (and (not (need-nice-1)) (need-nice-0) (not (remaining-5)) (remaining-4) (not (day-4)) (day-5) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n1-r4-d5
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-1) (remaining-4) (day-5))
    :effect (and (not (need-nice-1)) (need-nice-0) (not (remaining-4)) (remaining-3) (not (day-5)) (day-6) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n1-r3-d6
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-1) (remaining-3) (day-6))
    :effect (and (not (need-nice-1)) (need-nice-0) (not (remaining-3)) (remaining-2) (not (day-6)) (day-7) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n1-r2-d7
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-1) (remaining-2) (day-7))
    :effect (and (not (need-nice-1)) (need-nice-0) (not (remaining-2)) (remaining-1) (not (day-7)) (day-8) (increase (total-cost) 1))
  )
  (:action traveler-stay-nice-n1-r1-d8
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (need-nice-1) (remaining-1) (day-8))
    :effect (and (not (need-nice-1)) (need-nice-0) (not (remaining-1)) (remaining-0) (not (day-8)) (day-9) (increase (total-cost) 1))
  )

  (:action traveler-meet-friends
    :parameters (?ta - agent)
    :precondition (and (traveler-agent ?ta) (at ?ta nice) (not (met-friends)) (or (day-1) (day-2) (day-3) (day-4) (day-5) (day-6)))
    :effect (and (met-friends) (increase (total-cost) 0))
  )
)
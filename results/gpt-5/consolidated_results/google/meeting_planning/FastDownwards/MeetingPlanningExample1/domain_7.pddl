(define (domain sf_meet_betty_strips2)
  (:requirements :strips :typing :negative-preconditions)
  (:types slot offset mlevel)
  (:predicates
    (at-richmond)
    (at-financial)
    (cur-slot ?s - slot)
    (cur-off ?o - offset)
    (in-meeting)
    (met ?m - mlevel)
    (next-slot ?s1 - slot ?s2 - slot)        ; +5 minutes
    (next-3slot ?s1 - slot ?s2 - slot)        ; +15 minutes
    (next-4slot ?s1 - slot ?s2 - slot)        ; +20 minutes
    (next-12slot ?s1 - slot ?s2 - slot)       ; +60 minutes
    (next-off1 ?o1 - offset ?o2 - offset)     ; +1 minute mod 5
    (next-off2 ?o1 - offset ?o2 - offset)     ; +2 minutes mod 5
    (next-m15 ?m1 - mlevel ?m2 - mlevel)
    (next-m60 ?m1 - mlevel ?m2 - mlevel)
    (allowed-15 ?s - slot ?o - offset)        ; start times within 17:15–21:45 for +15
    (allowed-60 ?s - slot ?o - offset)        ; start times within 17:15–20:45 for +60
  )

  (:action travel-richmond-financial
    :parameters (?s1 - slot ?s2 - slot ?o1 - offset ?o2 - offset)
    :precondition (and
      (at-richmond)
      (not (at-financial))
      (not (in-meeting))
      (cur-slot ?s1)
      (cur-off ?o1)
      (next-4slot ?s1 ?s2)
      (next-off2 ?o1 ?o2)
    )
    :effect (and
      (not (at-richmond))
      (at-financial)
      (not (cur-slot ?s1))
      (cur-slot ?s2)
      (not (cur-off ?o1))
      (cur-off ?o2)
    )
  )

  (:action travel-financial-richmond
    :parameters (?s1 - slot ?s2 - slot ?o1 - offset ?o2 - offset)
    :precondition (and
      (at-financial)
      (not (at-richmond))
      (met g60)
      (not (in-meeting))
      (cur-slot ?s1)
      (cur-off ?o1)
      (next-4slot ?s1 ?s2)
      (next-off1 ?o1 ?o2)
    )
    :effect (and
      (not (at-financial))
      (at-richmond)
      (not (cur-slot ?s1))
      (cur-slot ?s2)
      (not (cur-off ?o1))
      (cur-off ?o2)
    )
  )

  (:action wait-5
    :parameters (?s1 - slot ?s2 - slot ?o - offset)
    :precondition (and
      (not (in-meeting))
      (cur-slot ?s1)
      (cur-off ?o)
      (next-slot ?s1 ?s2)
    )
    :effect (and
      (not (cur-slot ?s1))
      (cur-slot ?s2)
    )
  )

  (:action meet-betty-60
    :parameters (?s1 - slot ?s2 - slot ?o - offset ?m1 - mlevel ?m2 - mlevel)
    :precondition (and
      (at-financial)
      (not (in-meeting))
      (cur-slot ?s1)
      (cur-off ?o)
      (allowed-60 ?s1 ?o)
      (next-12slot ?s1 ?s2)
      (met ?m1)
      (next-m60 ?m1 ?m2)
    )
    :effect (and
      (not (cur-slot ?s1))
      (cur-slot ?s2)
      (not (met ?m1))
      (met ?m2)
    )
  )

  (:action meet-betty-15-start
    :parameters (?s1 - slot ?s2 - slot ?o - offset)
    :precondition (and
      (at-financial)
      (not (in-meeting))
      (cur-slot ?s1)
      (cur-off ?o)
      (allowed-15 ?s1 ?o)
      (next-3slot ?s1 ?s2)
      (met m0)
    )
    :effect (and
      (not (cur-slot ?s1))
      (cur-slot ?s2)
      (not (met m0))
      (met m15)
      (in-meeting)
    )
  )

  (:action meet-betty-15-continue1
    :parameters (?s1 - slot ?s2 - slot ?o - offset)
    :precondition (and
      (at-financial)
      (in-meeting)
      (cur-slot ?s1)
      (cur-off ?o)
      (allowed-15 ?s1 ?o)
      (next-3slot ?s1 ?s2)
      (met m15)
    )
    :effect (and
      (not (cur-slot ?s1))
      (cur-slot ?s2)
      (not (met m15))
      (met m30)
    )
  )

  (:action meet-betty-15-continue2
    :parameters (?s1 - slot ?s2 - slot ?o - offset)
    :precondition (and
      (at-financial)
      (in-meeting)
      (cur-slot ?s1)
      (cur-off ?o)
      (allowed-15 ?s1 ?o)
      (next-3slot ?s1 ?s2)
      (met m30)
    )
    :effect (and
      (not (cur-slot ?s1))
      (cur-slot ?s2)
      (not (met m30))
      (met m45)
    )
  )

  (:action meet-betty-15-finish
    :parameters (?s1 - slot ?s2 - slot ?o - offset)
    :precondition (and
      (at-financial)
      (in-meeting)
      (cur-slot ?s1)
      (cur-off ?o)
      (allowed-15 ?s1 ?o)
      (next-3slot ?s1 ?s2)
      (met m45)
    )
    :effect (and
      (not (cur-slot ?s1))
      (cur-slot ?s2)
      (not (met m45))
      (met g60)
      (not (in-meeting))
    )
  )
)
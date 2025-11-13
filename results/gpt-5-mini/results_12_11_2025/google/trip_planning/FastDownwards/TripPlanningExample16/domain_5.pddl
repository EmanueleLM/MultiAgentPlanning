(define (domain travel-integration)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    ;; day identity helpers to bind specific day objects to parameters
    (is-d1 ?d - day) (is-d2 ?d - day) (is-d3 ?d - day)
    (is-d4 ?d - day) (is-d5 ?d - day) (is-d6 ?d - day)
    (is-d7 ?d - day) (is-d8 ?d - day) (is-d9 ?d - day)

    ;; successor relation over days (ordered stages)
    (next ?d1 - day ?d2 - day)

    ;; workshop days window
    (workshop-day ?d - day)

    ;; sequential assignment control
    (ready ?d - day)

    ;; every day starts unassigned and an assignment action removes it
    (unassigned ?d - day)

    ;; assignment relation: day -> city
    (at ?d - day ?c - city)

    ;; direct flight connectivity (symmetric edges given in problem init)
    (direct ?c1 - city ?c2 - city)

    ;; last-city marker to enforce flight feasibility and contiguous occupancy
    (last-prague)
    (last-vienna)
    (last-porto)

    ;; discrete counted occupancy predicates (enforce exact quotas structurally)
    (count-prague-0) (count-prague-1) (count-prague-2) (count-prague-3)
    (count-vienna-0) (count-vienna-1) (count-vienna-2) (count-vienna-3)
    (count-porto-0)  (count-porto-1)  (count-porto-2)  (count-porto-3)
  )

  ;; Day 1..3 must be Prague (workshop). We implement specific assign actions for each day
  ;; and enforce transitions only if last-city marker and direct connectivity permit changes.
  (:action assign-d1-prague
    :parameters (?d - day ?nd - day)
    :precondition (and
      (is-d1 ?d) (is-d2 ?nd) (next ?d ?nd)
      (ready ?d) (unassigned ?d)
      (workshop-day ?d)
      (count-prague-0)
    )
    :effect (and
      (not (unassigned ?d))
      (at ?d prague)
      (not (ready ?d))
      (ready ?nd)
      (not (count-prague-0))
      (count-prague-1)
      ;; set last city to Prague exclusively
      (not (last-vienna))
      (not (last-porto))
      (last-prague)
    )
  )

  (:action assign-d2-prague
    :parameters (?d - day ?nd - day)
    :precondition (and
      (is-d2 ?d) (is-d3 ?nd) (next ?d ?nd)
      (ready ?d) (unassigned ?d)
      (workshop-day ?d)
      (last-prague)
      (count-prague-1)
    )
    :effect (and
      (not (unassigned ?d))
      (at ?d prague)
      (not (ready ?d))
      (ready ?nd)
      (not (count-prague-1))
      (count-prague-2)
      (not (last-vienna))
      (not (last-porto))
      (last-prague)
    )
  )

  (:action assign-d3-prague
    :parameters (?d - day ?nd - day)
    :precondition (and
      (is-d3 ?d) (is-d4 ?nd) (next ?d ?nd)
      (ready ?d) (unassigned ?d)
      (workshop-day ?d)
      (last-prague)
      (count-prague-2)
    )
    :effect (and
      (not (unassigned ?d))
      (at ?d prague)
      (not (ready ?d))
      (ready ?nd)
      (not (count-prague-2))
      (count-prague-3)
      (not (last-vienna))
      (not (last-porto))
      (last-prague)
    )
  )

  ;; Day 4..6: Vienna segment. Transition from Prague to Vienna requires direct(prague vienna).
  (:action assign-d4-vienna
    :parameters (?d - day ?nd - day)
    :precondition (and
      (is-d4 ?d) (is-d5 ?nd) (next ?d ?nd)
      (ready ?d) (unassigned ?d)
      (last-prague)
      (direct prague vienna)
      (count-vienna-0)
    )
    :effect (and
      (not (unassigned ?d))
      (at ?d vienna)
      (not (ready ?d))
      (ready ?nd)
      (not (count-vienna-0))
      (count-vienna-1)
      (not (last-prague))
      (not (last-porto))
      (last-vienna)
    )
  )

  (:action assign-d5-vienna
    :parameters (?d - day ?nd - day)
    :precondition (and
      (is-d5 ?d) (is-d6 ?nd) (next ?d ?nd)
      (ready ?d) (unassigned ?d)
      (last-vienna)
      (count-vienna-1)
    )
    :effect (and
      (not (unassigned ?d))
      (at ?d vienna)
      (not (ready ?d))
      (ready ?nd)
      (not (count-vienna-1))
      (count-vienna-2)
      (not (last-prague))
      (not (last-porto))
      (last-vienna)
    )
  )

  (:action assign-d6-vienna
    :parameters (?d - day ?nd - day)
    :precondition (and
      (is-d6 ?d) (is-d7 ?nd) (next ?d ?nd)
      (ready ?d) (unassigned ?d)
      (last-vienna)
      (count-vienna-2)
    )
    :effect (and
      (not (unassigned ?d))
      (at ?d vienna)
      (not (ready ?d))
      (ready ?nd)
      (not (count-vienna-2))
      (count-vienna-3)
      (not (last-prague))
      (not (last-porto))
      (last-vienna)
    )
  )

  ;; Day 7..9: Porto segment. Transition from Vienna to Porto requires direct(vienna porto).
  (:action assign-d7-porto
    :parameters (?d - day ?nd - day)
    :precondition (and
      (is-d7 ?d) (is-d8 ?nd) (next ?d ?nd)
      (ready ?d) (unassigned ?d)
      (last-vienna)
      (direct vienna porto)
      (count-porto-0)
    )
    :effect (and
      (not (unassigned ?d))
      (at ?d porto)
      (not (ready ?d))
      (ready ?nd)
      (not (count-porto-0))
      (count-porto-1)
      (not (last-prague))
      (not (last-vienna))
      (last-porto)
    )
  )

  (:action assign-d8-porto
    :parameters (?d - day ?nd - day)
    :precondition (and
      (is-d8 ?d) (is-d9 ?nd) (next ?d ?nd)
      (ready ?d) (unassigned ?d)
      (last-porto)
      (count-porto-1)
    )
    :effect (and
      (not (unassigned ?d))
      (at ?d porto)
      (not (ready ?d))
      (ready ?nd)
      (not (count-porto-1))
      (count-porto-2)
      (not (last-prague))
      (not (last-vienna))
      (last-porto)
    )
  )

  (:action assign-d9-porto
    :parameters (?d - day)
    :precondition (and
      (is-d9 ?d)
      (ready ?d)
      (unassigned ?d)
      (last-porto)
      (count-porto-2)
    )
    :effect (and
      (not (unassigned ?d))
      (at ?d porto)
      (not (ready ?d))
      (not (count-porto-2))
      (count-porto-3)
      (not (last-prague))
      (not (last-vienna))
      (last-porto)
    )
  )
)
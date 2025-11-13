(define (domain MeetingPlanningExample11)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types location person slot)
  (:predicates
    (at ?loc - location ?s - slot)
    (next ?s - slot ?s1 - slot)
    (carol_available ?s - slot)
    (meeting_0)
    (meeting_1)
    (meeting_2)
    (meeting_done)
  )
  (:functions (total-cost))
  ;; Travel from Nob_Hill to Sunset_District
  (:action travel_nob_to_sunset
    :parameters (?s ?s1 - slot)
    :precondition (and
      (at Nob_Hill ?s)
      (next ?s ?s1)
      ;; disallow travel if meeting is currently in progress (meeting_1 or meeting_2)
      (not (meeting_1))
      (not (meeting_2))
    )
    :effect (and
      (not (at Nob_Hill ?s))
      (at Sunset_District ?s1)
      (increase (total-cost) 25)
    )
  )
  ;; Travel from Sunset_District to Nob_Hill
  (:action travel_sunset_to_nob
    :parameters (?s ?s1 - slot)
    :precondition (and
      (at Sunset_District ?s)
      (next ?s ?s1)
      (not (meeting_1))
      (not (meeting_2))
    )
    :effect (and
      (not (at Sunset_District ?s))
      (at Nob_Hill ?s1)
      (increase (total-cost) 27)
    )
  )
  ;; Wait one slot at current location (not during meeting progress)
  (:action wait_one_slot
    :parameters (?loc - location ?s ?s1 - slot)
    :precondition (and
      (at ?loc ?s)
      (next ?s ?s1)
      (not (meeting_1))
      (not (meeting_2))
    )
    :effect (and
      (not (at ?loc ?s))
      (at ?loc ?s1)
    )
  )
  ;; Meeting step 1: consume first meeting slot (must be at Sunset_District and Carol available now)
  (:action meet_step1
    :parameters (?s ?s1 - slot)
    :precondition (and
      (at Sunset_District ?s)
      (next ?s ?s1)
      (carol_available ?s)
      (meeting_0)
    )
    :effect (and
      (not (meeting_0))
      (meeting_1)
      (not (at Sunset_District ?s))
      (at Sunset_District ?s1)
    )
  )
  ;; Meeting step 2: consume second meeting slot (Carol must be available)
  (:action meet_step2
    :parameters (?s ?s1 - slot)
    :precondition (and
      (at Sunset_District ?s)
      (next ?s ?s1)
      (carol_available ?s)
      (meeting_1)
    )
    :effect (and
      (not (meeting_1))
      (meeting_2)
      (not (at Sunset_District ?s))
      (at Sunset_District ?s1)
    )
  )
  ;; Meeting step 3: consume third meeting slot (finalizes meeting_done)
  (:action meet_step3
    :parameters (?s ?s1 - slot)
    :precondition (and
      (at Sunset_District ?s)
      (next ?s ?s1)
      (carol_available ?s)
      (meeting_2)
    )
    :effect (and
      (not (meeting_2))
      (meeting_done)
      (not (at Sunset_District ?s))
      (at Sunset_District ?s1)
    )
  )
)
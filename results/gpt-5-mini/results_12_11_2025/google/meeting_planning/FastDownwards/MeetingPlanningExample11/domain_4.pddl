(define (domain meeting_planning_example11)
  (:requirements :strips :typing :negative-preconditions)
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

  ;; Directed travel actions: each consumes exactly one slot (rounded-up 25 and 27 minutes -> 1 slot)
  (:action travel_nob_hill_to_sunset_district
    :parameters (?s ?s1 - slot)
    :precondition (and
      (at nob_hill ?s)
      (next ?s ?s1)
      (not (meeting_1))
      (not (meeting_2))
    )
    :effect (and
      (not (at nob_hill ?s))
      (at sunset_district ?s1)
    )
  )

  (:action travel_sunset_district_to_nob_hill
    :parameters (?s ?s1 - slot)
    :precondition (and
      (at sunset_district ?s)
      (next ?s ?s1)
      (not (meeting_1))
      (not (meeting_2))
    )
    :effect (and
      (not (at sunset_district ?s))
      (at nob_hill ?s1)
    )
  )

  ;; Wait one slot at the same location (cannot be used during an in-progress meeting)
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

  ;; Meeting progression actions: enforce contiguous meeting by advancing slot-by-slot at sunset_district
  ;; Each meet_step consumes one slot. Carol must be available at the current slot.
  ;; Travel and wait are prevented during meeting by their negative preconditions on meeting_1 and meeting_2.

  ;; Step 1: start meeting (first 30-min slot)
  (:action meet_step1
    :parameters (?s ?s1 - slot)
    :precondition (and
      (at sunset_district ?s)
      (next ?s ?s1)
      (carol_available ?s)
      (meeting_0)
    )
    :effect (and
      (not (meeting_0))
      (meeting_1)
      (not (at sunset_district ?s))
      (at sunset_district ?s1)
    )
  )

  ;; Step 2: continue meeting (second 30-min slot)
  (:action meet_step2
    :parameters (?s ?s1 - slot)
    :precondition (and
      (at sunset_district ?s)
      (next ?s ?s1)
      (carol_available ?s)
      (meeting_1)
    )
    :effect (and
      (not (meeting_1))
      (meeting_2)
      (not (at sunset_district ?s))
      (at sunset_district ?s1)
    )
  )

  ;; Step 3: finish meeting (third 30-min slot) -> meeting_done
  (:action meet_step3
    :parameters (?s ?s1 - slot)
    :precondition (and
      (at sunset_district ?s)
      (next ?s ?s1)
      (carol_available ?s)
      (meeting_2)
    )
    :effect (and
      (not (meeting_2))
      (meeting_done)
      (not (at sunset_district ?s))
      (at sunset_district ?s1)
    )
  )
)
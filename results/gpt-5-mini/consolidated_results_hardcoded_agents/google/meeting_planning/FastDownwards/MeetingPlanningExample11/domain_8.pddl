(define (domain meeting_planning_example11)
  (:requirements :strips :typing :negative-preconditions)
  (:types location person slot)

  (:predicates
    (at ?loc - location ?s - slot)              ; agent is at location at the start of slot ?s
    (next ?s - slot ?s1 - slot)                ; successor slot relation (ordered time progression)
    (carol_available ?s - slot)                ; Carol is present during slot ?s
    (directed ?from - location ?to - location) ; allowed directed travel edges
    (sunset_location ?loc - location)          ; marks the Sunset_District location
    (meeting_0)                                ; meeting not started
    (meeting_1)                                ; meeting in progress: 1 contiguous slot completed
    (meeting_2)                                ; meeting in progress: 2 contiguous slots completed
    (meeting_done)                             ; meeting requirement satisfied (>= 3 contiguous slots)
  )

  ;; Directed travel: moves from ?from at slot ?s to ?to at successor slot ?s1.
  ;; Travel consumes exactly one slot (travel times rounded up to one 30-min slot).
  (:action travel
    :parameters (?from ?to - location ?s ?s1 - slot)
    :precondition (and
      (at ?from ?s)
      (next ?s ?s1)
      (directed ?from ?to)
      (not (meeting_1))
      (not (meeting_2))
      (not (meeting_done))
    )
    :effect (and
      (not (at ?from ?s))
      (at ?to ?s1)
    )
  )

  ;; Wait one slot at the same location (cannot be used during an in-progress meeting or after completion)
  (:action wait_one_slot
    :parameters (?loc - location ?s ?s1 - slot)
    :precondition (and
      (at ?loc ?s)
      (next ?s ?s1)
      (not (meeting_1))
      (not (meeting_2))
      (not (meeting_done))
    )
    :effect (and
      (not (at ?loc ?s))
      (at ?loc ?s1)
    )
  )

  ;; Meeting progression actions: enforce contiguous meeting by advancing slot-by-slot at a location
  ;; declared as the Sunset District. Carol must be available at each consumed slot.
  ;; Each meet_step consumes one slot. Travel and wait are prevented during meeting by negative preconditions.

  ;; Start meeting: consume first 30-min slot (requires at sunset location at slot ?s, Carol present at ?s)
  (:action meet_step1
    :parameters (?loc - location ?s ?s1 - slot)
    :precondition (and
      (at ?loc ?s)
      (sunset_location ?loc)
      (next ?s ?s1)
      (carol_available ?s)
      (meeting_0)
      (not (meeting_done))
    )
    :effect (and
      (not (meeting_0))
      (meeting_1)
      (not (at ?loc ?s))
      (at ?loc ?s1)
    )
  )

  ;; Continue meeting: second contiguous slot
  (:action meet_step2
    :parameters (?loc - location ?s ?s1 - slot)
    :precondition (and
      (at ?loc ?s)
      (sunset_location ?loc)
      (next ?s ?s1)
      (carol_available ?s)
      (meeting_1)
      (not (meeting_done))
    )
    :effect (and
      (not (meeting_1))
      (meeting_2)
      (not (at ?loc ?s))
      (at ?loc ?s1)
    )
  )

  ;; Finish meeting: third contiguous slot -> meeting_done
  (:action meet_step3
    :parameters (?loc - location ?s ?s1 - slot)
    :precondition (and
      (at ?loc ?s)
      (sunset_location ?loc)
      (next ?s ?s1)
      (carol_available ?s)
      (meeting_2)
      (not (meeting_done))
    )
    :effect (and
      (not (meeting_2))
      (meeting_done)
      (not (at ?loc ?s))
      (at ?loc ?s1)
    )
  )
)
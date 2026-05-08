(define (domain meeting-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent loc time)

  (:predicates
    (next ?t1 - time ?t2 - time)
    (at ?a - agent ?l - loc ?t - time)
    (meeting-held ?tstart - time ?tend - time)
  )

  ;; TRAVELER actions (explicit separate agent actions)
  ;; Travel by a fixed realistic duration: 30 minutes = 2 x 15-minute time slots.
  ;; The action moves the traveler from ?from at time ?t0 to ?to at time ?t2,
  ;; requiring a next chain ?t0 -> ?t1 -> ?t2 and that the traveler is at ?from at ?t0
  ;; and not already recorded at ?to at the arrival time.
  (:action travel-30min-traveler
    :parameters (?tr - agent ?from - loc ?to - loc ?t0 - time ?t1 - time ?t2 - time)
    :precondition (and
      (at ?tr ?from ?t0)
      (next ?t0 ?t1)
      (next ?t1 ?t2)
      (not (at ?tr ?to ?t2))
    )
    :effect (and
      (not (at ?tr ?from ?t0))
      (at ?tr ?to ?t2)
    )
  )

  ;; WAIT / STAY action: extend presence of an agent at a location from one time slot to the next.
  (:action wait-15min
    :parameters (?ag - agent ?l - loc ?t0 - time ?t1 - time)
    :precondition (and
      (at ?ag ?l ?t0)
      (next ?t0 ?t1)
      (not (at ?ag ?l ?t1))
    )
    :effect (and
      (at ?ag ?l ?t1)
    )
  )

  ;; MARY actions (kept distinct even if Mary will be stationary during availability)
  ;; Mary can "confirm-availability" for a slot: ensures she is recorded at the meeting location for that slot.
  ;; In this model Mary is initially available for a contiguous window; this action is provided for symmetry
  ;; but is not necessary to satisfy the mandated meeting constraint given the problem initial state.
  (:action mary-confirm-availability-15min
    :parameters (?m - agent ?l - loc ?t0 - time ?t1 - time)
    :precondition (and
      (at ?m ?l ?t0)
      (next ?t0 ?t1)
      (not (at ?m ?l ?t1))
    )
    :effect (and
      (at ?m ?l ?t1)
    )
  )

  ;; START MEETING: must have both agents present at the meeting location for five contiguous 15-minute slots.
  ;; The action requires presence for t0..t4 and the next-chain linking them, and then records meeting-held.
  ;; This encodes the hard constraint that the meeting duration is contiguous and at least 75 minutes.
  (:action start-meeting-75min
    :parameters (?a1 - agent ?a2 - agent ?l - loc
                 ?t0 - time ?t1 - time ?t2 - time ?t3 - time ?t4 - time)
    :precondition (and
      ;; contiguous time slots
      (next ?t0 ?t1) (next ?t1 ?t2) (next ?t2 ?t3) (next ?t3 ?t4)
      ;; both agents present at each of the five slots
      (at ?a1 ?l ?t0) (at ?a2 ?l ?t0)
      (at ?a1 ?l ?t1) (at ?a2 ?l ?t1)
      (at ?a1 ?l ?t2) (at ?a2 ?l ?t2)
      (at ?a1 ?l ?t3) (at ?a2 ?l ?t3)
      (at ?a1 ?l ?t4) (at ?a2 ?l ?t4)
    )
    :effect (and
      (meeting-held ?t0 ?t4)
    )
  )
)
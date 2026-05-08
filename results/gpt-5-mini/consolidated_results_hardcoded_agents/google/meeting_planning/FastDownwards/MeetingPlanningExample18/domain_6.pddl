(define (domain meetingplanningexample18-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time)
  (:predicates
    (at ?l - location ?t - time)
    (succ ?t1 - time ?t2 - time)
    (travel-mr ?t1 - time ?t2 - time) ; marina -> richmond in 11 minutes
    (travel-rm ?t1 - time ?t2 - time) ; richmond -> marina in 9 minutes
    (plus75 ?t1 - time ?t2 - time)   ; t2 is t1 + 75 minutes
    (betty-window ?t - time)         ; allowed start times for 75-min meeting with Betty
    (met-betty)
  )

  ;; wait one minute at a location (ensures contiguous occupancy minute-by-minute)
  (:action wait
    :parameters (?loc - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?loc ?t1)
      (succ ?t1 ?t2)
    )
    :effect (and
      (not (at ?loc ?t1))
      (at ?loc ?t2)
    )
  )

  ;; travel from Marina to Richmond taking exactly 11 minutes (atomic)
  (:action travel-marina-richmond
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at marina ?t1)
      (travel-mr ?t1 ?t2)
    )
    :effect (and
      (not (at marina ?t1))
      (at richmond ?t2)
    )
  )

  ;; travel from Richmond to Marina taking exactly 9 minutes (atomic)
  (:action travel-richmond-marina
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at richmond ?t1)
      (travel-rm ?t1 ?t2)
    )
    :effect (and
      (not (at richmond ?t1))
      (at marina ?t2)
    )
  )

  ;; Meet Betty: start at a time that is a valid Betty-window start and lasts exactly 75 minutes
  (:action meet-betty
    :parameters (?tstart - time ?tend - time)
    :precondition (and
      (at richmond ?tstart)
      (plus75 ?tstart ?tend)
      (betty-window ?tstart)
    )
    :effect (and
      (met-betty)
      (not (at richmond ?tstart))
      (at richmond ?tend)
    )
  )
)
(define (domain meetingplanningexample18-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time)
  (:predicates
    (at ?l - location ?t - time)
    (succ ?t1 - time ?t2 - time)
    (travel-mr ?t1 - time ?t2 - time)
    (travel-rm ?t1 - time ?t2 - time)
    (plus75 ?t1 - time ?t2 - time)
    (betty-window ?t - time)
    (met-betty)
  )

  ;; wait from one defined timepoint to its successor (represents contiguous occupancy between those two timepoints)
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

  ;; travel from Marina to Richmond (takes exactly the minutes encoded by travel-mr relation)
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

  ;; travel from Richmond to Marina (takes exactly the minutes encoded by travel-rm relation)
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

  ;; Meet Betty: a single contiguous 75-minute meeting block
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
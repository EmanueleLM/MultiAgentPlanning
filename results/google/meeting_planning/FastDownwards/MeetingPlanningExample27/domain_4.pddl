(define (domain meetingplanningexample27-strips)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    location timepoint stage
  )
  (:predicates
    (at ?l - location)
    (time ?t - timepoint)
    (succ ?t1 - timepoint ?t2 - timepoint)
    (succ-stage ?s1 - stage ?s2 - stage)
    (window-start ?t - timepoint)
    (idle)
    (met-margaret)
    (moving-mp ?s - stage)
    (moving-pm ?s - stage)
    (meeting-margaret ?s - stage)
  )
  (:functions (total-cost) - number)

  (:action start-move-marina-to-pacific
    :parameters ()
    :precondition (and (at marina_district) (idle))
    :effect (and
      (not (at marina_district))
      (moving-mp s7)
      (not (idle))
    )
  )

  (:action tick-move-marina-to-pacific
    :parameters (?t1 - timepoint ?t2 - timepoint ?s1 - stage ?s2 - stage)
    :precondition (and
      (time ?t1)
      (succ ?t1 ?t2)
      (moving-mp ?s1)
      (succ-stage ?s1 ?s2)
      (not (moving-mp s1))
    )
    :effect (and
      (not (time ?t1)) (time ?t2)
      (not (moving-mp ?s1)) (moving-mp ?s2)
      (increase (total-cost) 1)
    )
  )

  (:action finish-move-marina-to-pacific
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (time ?t1)
      (succ ?t1 ?t2)
      (moving-mp s1)
    )
    :effect (and
      (not (time ?t1)) (time ?t2)
      (not (moving-mp s1))
      (at pacific_heights)
      (idle)
      (increase (total-cost) 1)
    )
  )

  (:action start-move-pacific-to-marina
    :parameters ()
    :precondition (and (at pacific_heights) (idle))
    :effect (and
      (not (at pacific_heights))
      (moving-pm s6)
      (not (idle))
    )
  )

  (:action tick-move-pacific-to-marina
    :parameters (?t1 - timepoint ?t2 - timepoint ?s1 - stage ?s2 - stage)
    :precondition (and
      (time ?t1)
      (succ ?t1 ?t2)
      (moving-pm ?s1)
      (succ-stage ?s1 ?s2)
      (not (moving-pm s1))
    )
    :effect (and
      (not (time ?t1)) (time ?t2)
      (not (moving-pm ?s1)) (moving-pm ?s2)
      (increase (total-cost) 1)
    )
  )

  (:action finish-move-pacific-to-marina
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (time ?t1)
      (succ ?t1 ?t2)
      (moving-pm s1)
    )
    :effect (and
      (not (time ?t1)) (time ?t2)
      (not (moving-pm s1))
      (at marina_district)
      (idle)
      (increase (total-cost) 1)
    )
  )

  (:action tick-wait-1min
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and (idle) (time ?t1) (succ ?t1 ?t2))
    :effect (and
      (not (time ?t1)) (time ?t2)
      (increase (total-cost) 1)
    )
  )

  (:action start-meet-margaret-15min
    :parameters (?t - timepoint)
    :precondition (and
      (at pacific_heights)
      (idle)
      (not (met-margaret))
      (time ?t)
      (window-start ?t)
    )
    :effect (and
      (meeting-margaret s15)
      (not (idle))
    )
  )

  (:action tick-meet-margaret
    :parameters (?t1 - timepoint ?t2 - timepoint ?s1 - stage ?s2 - stage)
    :precondition (and
      (time ?t1)
      (succ ?t1 ?t2)
      (meeting-margaret ?s1)
      (succ-stage ?s1 ?s2)
      (not (meeting-margaret s1))
    )
    :effect (and
      (not (time ?t1)) (time ?t2)
      (not (meeting-margaret ?s1)) (meeting-margaret ?s2)
      (increase (total-cost) 1)
    )
  )

  (:action finish-meet-margaret
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (time ?t1)
      (succ ?t1 ?t2)
      (meeting-margaret s1)
    )
    :effect (and
      (not (time ?t1)) (time ?t2)
      (not (meeting-margaret s1))
      (met-margaret)
      (idle)
      (increase (total-cost) 1)
    )
  )
)
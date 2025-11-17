(define (domain MeetingPlanningExample26)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types time loc)
  (:predicates
    (time ?t - time)
    (next ?t ?t2 - time)
    (loc ?l - loc)
    (at ?l ?t - time)
    (avail ?t - time)
    (meeting ?t - time)
  )
  (:functions (total-cost))
  ;; Wait one minute at same location
  (:action wait
    :parameters (?l - loc ?t ?t2 - time)
    :precondition (and (at ?l ?t) (next ?t ?t2))
    :effect (and
      (not (at ?l ?t))
      (at ?l ?t2)
      (increase (total-cost) 0)
    )
  )
  ;; Travel from Richmond_District to Presidio (7-minute chain)
  (:action move_Richmond_to_Presidio
    :parameters (?t ?t1 ?t2 ?t3 ?t4 ?t5 ?t6 ?t7 - time)
    :precondition (and
      (at Richmond_District ?t)
      (next ?t ?t1) (next ?t1 ?t2) (next ?t2 ?t3)
      (next ?t3 ?t4) (next ?t4 ?t5) (next ?t5 ?t6) (next ?t6 ?t7)
    )
    :effect (and
      (not (at Richmond_District ?t))
      (at Presidio ?t7)
      (increase (total-cost) 7)
    )
  )
  ;; Travel from Presidio to Richmond_District (7-minute chain)
  (:action move_Presidio_to_Richmond
    :parameters (?t ?t1 ?t2 ?t3 ?t4 ?t5 ?t6 ?t7 - time)
    :precondition (and
      (at Presidio ?t)
      (next ?t ?t1) (next ?t1 ?t2) (next ?t2 ?t3)
      (next ?t3 ?t4) (next ?t4 ?t5) (next ?t5 ?t6) (next ?t6 ?t7)
    )
    :effect (and
      (not (at Presidio ?t))
      (at Richmond_District ?t7)
      (increase (total-cost) 7)
    )
  )
  ;; Meet Sarah for one minute: allowed only at Presidio and only when Sarah is available at that start minute
  (:action meet_sarah_one_minute
    :parameters (?t ?t2 - time)
    :precondition (and
      (at Presidio ?t)
      (next ?t ?t2)
      (avail ?t)
    )
    :effect (and
      (not (at Presidio ?t))
      (at Presidio ?t2)
      (meeting ?t)
      (increase (total-cost) 0)
    )
  )
  (:metric minimize (total-cost))
)
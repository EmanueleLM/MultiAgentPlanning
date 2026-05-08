(define (domain san_francisco_day_visit)
  (:requirements :strips :typing)

  (:types
    location
    time
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (next ?t1 - time ?t2 - time)
    (bv_to_ph_pair ?depart - time ?arrive - time)
    (ph_to_bv_pair ?depart - time ?arrive - time)
    (met_thomas)
  )

  (:action wait
    :parameters (?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?l)
      (current_time ?t1)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action move_bayview_to_pacific_heights
    :parameters (?depart - time ?arrive - time)
    :precondition (and
      (at bayview)
      (current_time ?depart)
      (bv_to_ph_pair ?depart ?arrive)
    )
    :effect (and
      (not (at bayview))
      (at pacific_heights)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action move_pacific_heights_to_bayview
    :parameters (?depart - time ?arrive - time)
    :precondition (and
      (at pacific_heights)
      (current_time ?depart)
      (ph_to_bv_pair ?depart ?arrive)
    )
    :effect (and
      (not (at pacific_heights))
      (at bayview)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action meet_thomas_105
    :parameters ()
    :precondition (and
      (at pacific_heights)
      (current_time t1215)
      (not (met_thomas))
    )
    :effect (and
      (met_thomas)
      (not (current_time t1215))
      (current_time t1400)
    )
  )
)
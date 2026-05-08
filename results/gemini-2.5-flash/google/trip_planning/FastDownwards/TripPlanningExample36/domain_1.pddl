(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    city
    time_point
  )
  (:predicates
    (at ?c - city)
    (connected ?from ?to - city)
    (current_time ?t - time_point)
    (next_time ?t1 ?t2 - time_point)
    (florence_day_completed_1)
    (florence_day_completed_2)
    (warsaw_day_completed_1)
    (warsaw_day_completed_2)
    (warsaw_day_completed_3)
    (warsaw_day_completed_4)
    (warsaw_day_completed_5)
    (warsaw_day_completed_6)
    (warsaw_day_completed_7)
    (munich_day_completed_1)
    (munich_day_completed_2)
    (munich_day_completed_3)
    (munich_day_completed_4)
    (munich_day_completed_5)
    (munich_day_completed_6)
  )

  (:functions
    (total-cost) - number
  )

  ;; Action to fly between cities
  (action fly
    :parameters (?from ?to - city ?t_curr ?t_next - time_point)
    :precondition (and
      (at ?from)
      (connected ?from ?to)
      (current_time ?t_curr)
      (next_time ?t_curr ?t_next)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?t_curr))
      (current_time ?t_next)
      (increase (total-cost) 1)
    )
  )

  ;; Stay actions for Florence (2 days)
  (action stay_in_florence_day_1
    :parameters (?t_curr ?t_next - time_point)
    :precondition (and
      (at florence)
      (current_time ?t_curr)
      (next_time ?t_curr ?t_next)
      (not (florence_day_completed_1))
    )
    :effect (and
      (florence_day_completed_1)
      (not (current_time ?t_curr))
      (current_time ?t_next)
      (increase (total-cost) 1)
    )
  )

  (action stay_in_florence_day_2
    :parameters (?t_curr ?t_next - time_point)
    :precondition (and
      (at florence)
      (current_time ?t_curr)
      (next_time ?t_curr ?t_next)
      (florence_day_completed_1) ; Must complete day 1 before day 2
      (not (florence_day_completed_2))
    )
    :effect (and
      (florence_day_completed_2)
      (not (current_time ?t_curr))
      (current_time ?t_next)
      (increase (total-cost) 1)
    )
  )

  ;; Stay actions for Warsaw (7 days)
  (action stay_in_warsaw_day_1
    :parameters (?t_curr ?t_next - time_point)
    :precondition (and
      (at warsaw)
      (current_time ?t_curr)
      (next_time ?t_curr ?t_next)
      (not (warsaw_day_completed_1))
    )
    :effect (and
      (warsaw_day_completed_1)
      (not (current_time ?t_curr))
      (current_time ?t_next)
      (increase (total-cost) 1)
    )
  )
  (action stay_in_warsaw_day_2
    :parameters (?t_curr ?t_next - time_point)
    :precondition (and
      (at warsaw)
      (current_time ?t_curr)
      (next_time ?t_curr ?t_next)
      (warsaw_day_completed_1)
      (not (warsaw_day_completed_2))
    )
    :effect (and
      (warsaw_day_completed_2)
      (not (current_time ?t_curr))
      (current_time ?t_next)
      (increase (total-cost) 1)
    )
  )
  (action stay_in_warsaw_day_3
    :parameters (?t_curr ?t_next - time_point)
    :precondition (and
      (at warsaw)
      (current_time ?t_curr)
      (next_time ?t_curr ?t_next)
      (warsaw_day_completed_2)
      (not (warsaw_day_completed_3))
    )
    :effect (and
      (warsaw_day_completed_3)
      (not (current_time ?t_curr))
      (current_time ?t_next)
      (increase (total-cost) 1)
    )
  )
  (action stay_in_warsaw_day_4
    :parameters (?t_curr ?t_next - time_point)
    :precondition (and
      (at warsaw)
      (current_time ?t_curr)
      (next_time ?t_curr ?t_next)
      (warsaw_day_completed_3)
      (not (warsaw_day_completed_4))
    )
    :effect (and
      (warsaw_day_completed_4)
      (not (current_time ?t_curr))
      (current_time ?t_next)
      (increase (total-cost) 1)
    )
  )
  (action stay_in_warsaw_day_5
    :parameters (?t_curr ?t_next - time_point)
    :precondition (and
      (at warsaw)
      (current_time ?t_curr)
      (next_time ?t_curr ?t_next)
      (warsaw_day_completed_4)
      (not (warsaw_day_completed_5))
    )
    :effect (and
      (warsaw_day_completed_5)
      (not (current_time ?t_curr))
      (current_time ?t_next)
      (increase (total-cost) 1)
    )
  )
  (action stay_in_warsaw_day_6
    :parameters (?t_curr ?t_next - time_point)
    :precondition (and
      (at warsaw)
      (current_time ?t_curr)
      (next_time ?t_curr ?t_next)
      (warsaw_day_completed_5)
      (not (warsaw_day_completed_6))
    )
    :effect (and
      (warsaw_day_completed_6)
      (not (current_time ?t_curr))
      (current_time ?t_next)
      (increase (total-cost) 1)
    )
  )
  (action stay_in_warsaw_day_7
    :parameters (?t_curr ?t_next - time_point)
    :precondition (and
      (at warsaw)
      (current_time ?t_curr)
      (next_time ?t_curr ?t_next)
      (warsaw_day_completed_6)
      (not (warsaw_day_completed_7))
    )
    :effect (and
      (warsaw_day_completed_7)
      (not (current_time ?t_curr))
      (current_time ?t_next)
      (increase (total-cost) 1)
    )
  )

  ;; Stay actions for Munich (6 days)
  (action stay_in_munich_day_1
    :parameters (?t_curr ?t_next - time_point)
    :precondition (and
      (at munich)
      (current_time ?t_curr)
      (next_time ?t_curr ?t_next)
      (not (munich_day_completed_1))
    )
    :effect (and
      (munich_day_completed_1)
      (not (current_time ?t_curr))
      (current_time ?t_next)
      (increase (total-cost) 1)
    )
  )
  (action stay_in_munich_day_2
    :parameters (?t_curr ?t_next - time_point)
    :precondition (and
      (at munich)
      (current_time ?t_curr)
      (next_time ?t_curr ?t_next)
      (munich_day_completed_1)
      (not (munich_day_completed_2))
    )
    :effect (and
      (munich_day_completed_2)
      (not (current_time ?t_curr))
      (current_time ?t_next)
      (increase (total-cost) 1)
    )
  )
  (action stay_in_munich_day_3
    :parameters (?t_curr ?t_next - time_point)
    :precondition (and
      (at munich)
      (current_time ?t_curr)
      (next_time ?t_curr ?t_next)
      (munich_day_completed_2)
      (not (munich_day_completed_3))
    )
    :effect (and
      (munich_day_completed_3)
      (not (current_time ?t_curr))
      (current_time ?t_next)
      (increase (total-cost) 1)
    )
  )
  (action stay_in_munich_day_4
    :parameters (?t_curr ?t_next - time_point)
    :precondition (and
      (at munich)
      (current_time ?t_curr)
      (next_time ?t_curr ?t_next)
      (munich_day_completed_3)
      (not (munich_day_completed_4))
    )
    :effect (and
      (munich_day_completed_4)
      (not (current_time ?t_curr))
      (current_time ?t_next)
      (increase (total-cost) 1)
    )
  )
  (action stay_in_munich_day_5
    :parameters (?t_curr ?t_next - time_point)
    :precondition (and
      (at munich)
      (current_time ?t_curr)
      (next_time ?t_curr ?t_next)
      (munich_day_completed_4)
      (not (munich_day_completed_5))
    )
    :effect (and
      (munich_day_completed_5)
      (not (current_time ?t_curr))
      (current_time ?t_next)
      (increase (total-cost) 1)
    )
  )
  (action stay_in_munich_day_6
    :parameters (?t_curr ?t_next - time_point)
    :precondition (and
      (at munich)
      (current_time ?t_curr)
      (next_time ?t_curr ?t_next)
      (munich_day_completed_5)
      (not (munich_day_completed_6))
    )
    :effect (and
      (munich_day_completed_6)
      (not (current_time ?t_curr))
      (current_time ?t_next)
      (increase (total-cost) 1)
    )
  )
)
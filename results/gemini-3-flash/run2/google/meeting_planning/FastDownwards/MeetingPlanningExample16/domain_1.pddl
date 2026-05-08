(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time)
  (:predicates
    (at_loc ?l - location)
    (at_time ?t - time)
    (next_time ?t1 ?t2 - time)
    (can_move ?l1 ?l2 - location ?t1 ?t2 - time)
    (can_meet ?l - location ?t1 ?t2 - time)
    (met_ronald)
  )

  ;; Wait action: Time passes while staying at the same location.
  (:action wait
    :parameters (?t_from - time ?t_to - time)
    :precondition (and 
      (at_time ?t_from) 
      (next_time ?t_from ?t_to)
    )
    :effect (and 
      (at_time ?t_to) 
      (not (at_time ?t_from))
    )
  )

  ;; Move action: Travel from one location to another, advancing time by the specific travel duration.
  (:action move
    :parameters (?l_from - location ?l_to - location ?t_from - time ?t_to - time)
    :precondition (and 
      (at_loc ?l_from) 
      (at_time ?t_from) 
      (can_move ?l_from ?l_to ?t_from ?t_to)
    )
    :effect (and 
      (at_loc ?l_to) 
      (not (at_loc ?l_from)) 
      (at_time ?t_to) 
      (not (at_time ?t_from))
    )
  )

  ;; Meet Ronald: Meet Ronald at a specific location for a specific duration.
  ;; The duration is encoded by the discrete jump between time points.
  (:action meet_ronald
    :parameters (?l - location ?t_start - time ?t_end - time)
    :precondition (and 
      (at_loc ?l) 
      (at_time ?t_start) 
      (can_meet ?l ?t_start ?t_end)
    )
    :effect (and 
      (met_ronald) 
      (at_time ?t_end) 
      (not (at_time ?t_start))
    )
  )
)
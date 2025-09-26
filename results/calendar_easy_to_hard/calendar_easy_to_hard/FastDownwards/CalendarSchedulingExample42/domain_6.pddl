(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :fluents)
  (:types person time)
  (:constants
    samantha brian arthur matthew marilyn mark andrea - person
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 - time
  )
  (:predicates
    (available ?p - person ?t - time)
    (proposed ?t - time)
    (chosen)
    (attending ?p - person)
    (in-work ?t - time)
  )
  (:functions (total-cost))

  (:action set-proposed-t0
    :parameters ()
    :precondition (and (not (chosen)) (in-work t0))
    :effect (and (proposed t0) (chosen) (increase (total-cost) 0))
  )
  (:action set-proposed-t1
    :parameters ()
    :precondition (and (not (chosen)) (in-work t1))
    :effect (and (proposed t1) (chosen) (increase (total-cost) 1))
  )
  (:action set-proposed-t2
    :parameters ()
    :precondition (and (not (chosen)) (in-work t2))
    :effect (and (proposed t2) (chosen) (increase (total-cost) 2))
  )
  (:action set-proposed-t3
    :parameters ()
    :precondition (and (not (chosen)) (in-work t3))
    :effect (and (proposed t3) (chosen) (increase (total-cost) 3))
  )
  (:action set-proposed-t4
    :parameters ()
    :precondition (and (not (chosen)) (in-work t4))
    :effect (and (proposed t4) (chosen) (increase (total-cost) 4))
  )
  (:action set-proposed-t5
    :parameters ()
    :precondition (and (not (chosen)) (in-work t5))
    :effect (and (proposed t5) (chosen) (increase (total-cost) 5))
  )
  (:action set-proposed-t6
    :parameters ()
    :precondition (and (not (chosen)) (in-work t6))
    :effect (and (proposed t6) (chosen) (increase (total-cost) 6))
  )
  (:action set-proposed-t7
    :parameters ()
    :precondition (and (not (chosen)) (in-work t7))
    :effect (and (proposed t7) (chosen) (increase (total-cost) 7))
  )
  (:action set-proposed-t8
    :parameters ()
    :precondition (and (not (chosen)) (in-work t8))
    :effect (and (proposed t8) (chosen) (increase (total-cost) 8))
  )
  (:action set-proposed-t9
    :parameters ()
    :precondition (and (not (chosen)) (in-work t9))
    :effect (and (proposed t9) (chosen) (increase (total-cost) 9))
  )
  (:action set-proposed-t10
    :parameters ()
    :precondition (and (not (chosen)) (in-work t10))
    :effect (and (proposed t10) (chosen) (increase (total-cost) 10))
  )
  (:action set-proposed-t11
    :parameters ()
    :precondition (and (not (chosen)) (in-work t11))
    :effect (and (proposed t11) (chosen) (increase (total-cost) 11))
  )
  (:action set-proposed-t12
    :parameters ()
    :precondition (and (not (chosen)) (in-work t12))
    :effect (and (proposed t12) (chosen) (increase (total-cost) 12))
  )
  (:action set-proposed-t13
    :parameters ()
    :precondition (and (not (chosen)) (in-work t13))
    :effect (and (proposed t13) (chosen) (increase (total-cost) 13))
  )
  (:action set-proposed-t14
    :parameters ()
    :precondition (and (not (chosen)) (in-work t14))
    :effect (and (proposed t14) (chosen) (increase (total-cost) 14))
  )
  (:action set-proposed-t15
    :parameters ()
    :precondition (and (not (chosen)) (in-work t15))
    :effect (and (proposed t15) (chosen) (increase (total-cost) 15))
  )

  (:action attend-samantha
    :parameters (?t - time)
    :precondition (and (proposed ?t) (available samantha ?t) (not (attending samantha)))
    :effect (attending samantha)
  )

  (:action attend-brian
    :parameters (?t - time)
    :precondition (and (proposed ?t) (available brian ?t) (not (attending brian)))
    :effect (attending brian)
  )

  (:action attend-arthur
    :parameters (?t - time)
    :precondition (and (proposed ?t) (available arthur ?t) (not (attending arthur)))
    :effect (attending arthur)
  )

  (:action attend-matthew
    :parameters (?t - time)
    :precondition (and (proposed ?t) (available matthew ?t) (not (attending matthew)))
    :effect (attending matthew)
  )

  (:action attend-marilyn
    :parameters (?t - time)
    :precondition (and (proposed ?t) (available marilyn ?t) (not (attending marilyn)))
    :effect (attending marilyn)
  )

  (:action attend-mark
    :parameters (?t - time)
    :precondition (and (proposed ?t) (available mark ?t) (not (attending mark)))
    :effect (attending mark)
  )

  (:action attend-andrea
    :parameters (?t - time)
    :precondition (and (proposed ?t) (available andrea ?t) (not (attending andrea)))
    :effect (attending andrea)
  )
)
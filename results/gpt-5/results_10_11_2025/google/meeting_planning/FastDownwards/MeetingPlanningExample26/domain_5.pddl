(define (domain meeting_sarah_domain)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types time loc count)
  (:constants
    richmond_district presidio - loc
  )
  (:predicates
    (next ?t1 - time ?t2 - time)
    (curr ?t - time)
    (at ?l - loc)
    (available-sarah ?t - time)
    (streak ?c - count)
    (nextc ?c1 - count ?c2 - count)
    (is-c105 ?c - count)
    (is-c0 ?c - count)
    (achieved)
  )
  (:functions (total-cost))

  (:action wait-1min-from-c0
    :parameters (?t - time ?t2 - time ?c - count)
    :precondition (and (curr ?t) (next ?t ?t2) (streak ?c) (is-c0 ?c))
    :effect (and
      (not (curr ?t)) (curr ?t2)
    )
  )

  (:action wait-1min-break
    :parameters (?t - time ?t2 - time ?c - count ?cz - count)
    :precondition (and (curr ?t) (next ?t ?t2) (streak ?c) (not (is-c0 ?c)) (is-c0 ?cz))
    :effect (and
      (not (curr ?t)) (curr ?t2)
      (not (streak ?c)) (streak ?cz)
    )
  )

  (:action move-rd-to-presidio-7min-from-c0
    :parameters (?t0 - time ?t1 - time ?t2 - time ?t3 - time ?t4 - time ?t5 - time ?t6 - time ?t7 - time ?c - count)
    :precondition (and
      (at richmond_district)
      (curr ?t0)
      (next ?t0 ?t1) (next ?t1 ?t2) (next ?t2 ?t3) (next ?t3 ?t4)
      (next ?t4 ?t5) (next ?t5 ?t6) (next ?t6 ?t7)
      (streak ?c) (is-c0 ?c)
    )
    :effect (and
      (not (at richmond_district)) (at presidio)
      (not (curr ?t0)) (curr ?t7)
      (increase (total-cost) 7)
    )
  )

  (:action move-rd-to-presidio-7min-break
    :parameters (?t0 - time ?t1 - time ?t2 - time ?t3 - time ?t4 - time ?t5 - time ?t6 - time ?t7 - time ?c - count ?cz - count)
    :precondition (and
      (at richmond_district)
      (curr ?t0)
      (next ?t0 ?t1) (next ?t1 ?t2) (next ?t2 ?t3) (next ?t3 ?t4)
      (next ?t4 ?t5) (next ?t5 ?t6) (next ?t6 ?t7)
      (streak ?c) (not (is-c0 ?c)) (is-c0 ?cz)
    )
    :effect (and
      (not (at richmond_district)) (at presidio)
      (not (curr ?t0)) (curr ?t7)
      (not (streak ?c)) (streak ?cz)
      (increase (total-cost) 7)
    )
  )

  (:action move-presidio-to-rd-7min-from-c0
    :parameters (?t0 - time ?t1 - time ?t2 - time ?t3 - time ?t4 - time ?t5 - time ?t6 - time ?t7 - time ?c - count)
    :precondition (and
      (at presidio)
      (curr ?t0)
      (next ?t0 ?t1) (next ?t1 ?t2) (next ?t2 ?t3) (next ?t3 ?t4)
      (next ?t4 ?t5) (next ?t5 ?t6) (next ?t6 ?t7)
      (streak ?c) (is-c0 ?c)
    )
    :effect (and
      (not (at presidio)) (at richmond_district)
      (not (curr ?t0)) (curr ?t7)
      (increase (total-cost) 7)
    )
  )

  (:action move-presidio-to-rd-7min-break
    :parameters (?t0 - time ?t1 - time ?t2 - time ?t3 - time ?t4 - time ?t5 - time ?t6 - time ?t7 - time ?c - count ?cz - count)
    :precondition (and
      (at presidio)
      (curr ?t0)
      (next ?t0 ?t1) (next ?t1 ?t2) (next ?t2 ?t3) (next ?t3 ?t4)
      (next ?t4 ?t5) (next ?t5 ?t6) (next ?t6 ?t7)
      (streak ?c) (not (is-c0 ?c)) (is-c0 ?cz)
    )
    :effect (and
      (not (at presidio)) (at richmond_district)
      (not (curr ?t0)) (curr ?t7)
      (not (streak ?c)) (streak ?cz)
      (increase (total-cost) 7)
    )
  )

  (:action meet-sarah-advance
    :parameters (?t - time ?t2 - time ?c - count ?c2 - count)
    :precondition (and
      (at presidio)
      (curr ?t) (next ?t ?t2)
      (available-sarah ?t)
      (streak ?c) (nextc ?c ?c2)
      (not (is-c105 ?c2))
    )
    :effect (and
      (not (curr ?t)) (curr ?t2)
      (not (streak ?c)) (streak ?c2)
    )
  )

  (:action meet-sarah-final
    :parameters (?t - time ?t2 - time ?c - count ?c2 - count)
    :precondition (and
      (at presidio)
      (curr ?t) (next ?t ?t2)
      (available-sarah ?t)
      (streak ?c) (nextc ?c ?c2)
      (is-c105 ?c2)
    )
    :effect (and
      (not (curr ?t)) (curr ?t2)
      (not (streak ?c)) (streak ?c2)
      (achieved)
    )
  )
)
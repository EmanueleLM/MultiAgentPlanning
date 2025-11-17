(define (domain objects-manipulation)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj time)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?o1 - obj ?o2 - obj)
    (next ?o1 - obj ?o2 - obj)
    (sneeze ?o - obj)
    (collect ?o1 - obj ?o2 - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)

    (current ?t - time)
    (time-next ?t1 - time ?t2 - time)
  )

  (:action paltry
    :parameters (?h - obj ?c - obj ?t - obj ?cur - time ?nxt - time)
    :precondition (and
                    (hand ?h) (cats ?c) (texture ?t)
                    (vase ?h ?c) (next ?c ?t)
                    (current ?cur) (time-next ?cur ?nxt))
    :effect (and
              (next ?h ?t)
              (not (vase ?h ?c))
              (not (current ?cur)) (current ?nxt))
  )

  (:action sip
    :parameters (?h - obj ?c - obj ?t - obj ?cur - time ?nxt - time)
    :precondition (and
                    (hand ?h) (cats ?c) (texture ?t)
                    (next ?h ?t) (next ?c ?t)
                    (current ?cur) (time-next ?cur ?nxt))
    :effect (and
              (vase ?h ?c)
              (not (next ?h ?t))
              (not (current ?cur)) (current ?nxt))
  )

  (:action clip
    :parameters (?h - obj ?s - obj ?t - obj ?cur - time ?nxt - time)
    :precondition (and
                    (hand ?h) (sneeze ?s) (texture ?t)
                    (next ?s ?t) (next ?h ?t)
                    (current ?cur) (time-next ?cur ?nxt))
    :effect (and
              (vase ?h ?s)
              (not (next ?h ?t))
              (not (current ?cur)) (current ?nxt))
  )

  (:action wretched
    :parameters (?s - obj ?t1 - obj ?t2 - obj ?st - obj ?cur - time ?nxt - time)
    :precondition (and
                    (sneeze ?s) (texture ?t1) (texture ?t2) (stupendous ?st)
                    (next ?s ?t1) (collect ?t1 ?st) (collect ?t2 ?st)
                    (current ?cur) (time-next ?cur ?nxt))
    :effect (and
              (next ?s ?t2)
              (not (next ?s ?t1))
              (not (current ?cur)) (current ?nxt))
  )

  (:action memory
    :parameters (?c - obj ?s1 - obj ?s2 - obj ?cur - time ?nxt - time)
    :precondition (and
                    (cats ?c) (spring ?s1) (spring ?s2)
                    (next ?c ?s1)
                    (current ?cur) (time-next ?cur ?nxt))
    :effect (and
              (next ?c ?s2)
              (not (next ?c ?s1))
              (not (current ?cur)) (current ?nxt))
  )

  (:action tightfisted
    :parameters (?h - obj ?s - obj ?t - obj ?cur - time ?nxt - time)
    :precondition (and
                    (hand ?h) (sneeze ?s) (texture ?t)
                    (next ?s ?t) (vase ?h ?s)
                    (current ?cur) (time-next ?cur ?nxt))
    :effect (and
              (next ?h ?t)
              (not (vase ?h ?s))
              (not (current ?cur)) (current ?nxt))
  )
)
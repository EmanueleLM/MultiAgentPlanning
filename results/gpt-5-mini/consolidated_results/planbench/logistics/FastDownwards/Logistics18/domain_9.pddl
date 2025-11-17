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

    ;; explicit discrete time bookkeeping for strict sequential actions
    (current ?t - time)
    (time-next ?t1 - time ?t2 - time)
  )

  ;; paltry: requires (hand h) (cats c) (texture t) (vase h c) (next c t)
  ;; effect: set (next h t), remove (vase h c), advance current time
  (:action paltry
    :parameters (?h - obj ?c - obj ?t - obj ?cur - time ?nxt - time)
    :precondition (and
                    (hand ?h)
                    (cats ?c)
                    (texture ?t)
                    (vase ?h ?c)
                    (next ?c ?t)
                    (current ?cur)
                    (time-next ?cur ?nxt))
    :effect (and
              (next ?h ?t)
              (not (vase ?h ?c))
              (not (current ?cur))
              (current ?nxt))
  )

  ;; sip: requires (hand h) (cats c) (texture t) (next h t) (next c t)
  ;; effect: set (vase h c), remove (next h t), advance current time
  (:action sip
    :parameters (?h - obj ?c - obj ?t - obj ?cur - time ?nxt - time)
    :precondition (and
                    (hand ?h)
                    (cats ?c)
                    (texture ?t)
                    (next ?h ?t)
                    (next ?c ?t)
                    (current ?cur)
                    (time-next ?cur ?nxt))
    :effect (and
              (vase ?h ?c)
              (not (next ?h ?t))
              (not (current ?cur))
              (current ?nxt))
  )

  ;; clip: requires (hand h) (sneeze s) (texture t) (next s t) (next h t)
  ;; effect: set (vase h s), remove (next h t), advance current time
  (:action clip
    :parameters (?h - obj ?s - obj ?t - obj ?cur - time ?nxt - time)
    :precondition (and
                    (hand ?h)
                    (sneeze ?s)
                    (texture ?t)
                    (next ?s ?t)
                    (next ?h ?t)
                    (current ?cur)
                    (time-next ?cur ?nxt))
    :effect (and
              (vase ?h ?s)
              (not (next ?h ?t))
              (not (current ?cur))
              (current ?nxt))
  )

  ;; wretched: requires (sneeze s) (texture t1) (texture t2) (stupendous st)
  ;;           (next s t1) (collect t1 st) (collect t2 st)
  ;; effect: set (next s t2), remove (next s t1), advance current time
  (:action wretched
    :parameters (?s - obj ?t1 - obj ?t2 - obj ?st - obj ?cur - time ?nxt - time)
    :precondition (and
                    (sneeze ?s)
                    (texture ?t1)
                    (texture ?t2)
                    (stupendous ?st)
                    (next ?s ?t1)
                    (collect ?t1 ?st)
                    (collect ?t2 ?st)
                    (current ?cur)
                    (time-next ?cur ?nxt))
    :effect (and
              (next ?s ?t2)
              (not (next ?s ?t1))
              (not (current ?cur))
              (current ?nxt))
  )

  ;; memory: requires (cats c) (spring s1) (spring s2) (next c s1)
  ;; effect: set (next c s2), remove (next c s1), advance current time
  (:action memory
    :parameters (?c - obj ?s1 - obj ?s2 - obj ?cur - time ?nxt - time)
    :precondition (and
                    (cats ?c)
                    (spring ?s1)
                    (spring ?s2)
                    (next ?c ?s1)
                    (current ?cur)
                    (time-next ?cur ?nxt))
    :effect (and
              (next ?c ?s2)
              (not (next ?c ?s1))
              (not (current ?cur))
              (current ?nxt))
  )

  ;; tightfisted: requires (hand h) (sneeze s) (texture t) (next s t) (vase h s)
  ;; effect: set (next h t), remove (vase h s), advance current time
  (:action tightfisted
    :parameters (?h - obj ?s - obj ?t - obj ?cur - time ?nxt - time)
    :precondition (and
                    (hand ?h)
                    (sneeze ?s)
                    (texture ?t)
                    (next ?s ?t)
                    (vase ?h ?s)
                    (current ?cur)
                    (time-next ?cur ?nxt))
    :effect (and
              (next ?h ?t)
              (not (vase ?h ?s))
              (not (current ?cur))
              (current ?nxt))
  )
)
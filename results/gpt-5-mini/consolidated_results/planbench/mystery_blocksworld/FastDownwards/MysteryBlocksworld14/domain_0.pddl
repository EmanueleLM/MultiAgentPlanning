(define (domain orchestrated-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?a - obj ?b - obj)
    (next ?a - obj ?b - obj)
    (sneeze ?o - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
    (collect ?a - obj ?b - obj)
  )

  ;; clip ?a ?b ?c
  ;; Pre: hand(?a), sneeze(?b), texture(?c), next(?b,?c), next(?a,?c)
  ;; Effects: add vase(?a,?b), del next(?a,?c)
  (:action clip
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c)
      (next ?a ?c)
    )
    :effect (and
      (vase ?a ?b)
      (not (next ?a ?c))
    )
  )

  ;; wretched ?s ?from ?to ?owner
  ;; Pre: sneeze(?s), texture(?from), texture(?to), stupendous(?owner),
  ;;      next(?s,?from), collect(?from,?owner), collect(?to,?owner)
  ;; Effects: add next(?s,?to), del next(?s,?from)
  (:action wretched
    :parameters (?s - obj ?from - obj ?to - obj ?owner - obj)
    :precondition (and
      (sneeze ?s)
      (texture ?from)
      (texture ?to)
      (stupendous ?owner)
      (next ?s ?from)
      (collect ?from ?owner)
      (collect ?to ?owner)
    )
    :effect (and
      (next ?s ?to)
      (not (next ?s ?from))
    )
  )

  ;; tightfisted ?a ?b ?c
  ;; Pre: hand(?a), sneeze(?b), texture(?c), next(?b,?c), vase(?a,?b)
  ;; Effects: add next(?a,?c), del vase(?a,?b)
  (:action tightfisted
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c)
      (vase ?a ?b)
    )
    :effect (and
      (next ?a ?c)
      (not (vase ?a ?b))
    )
  )

  ;; sip ?a ?b ?c
  ;; Pre: hand(?a), cats(?b), texture(?c), next(?a,?c), next(?b,?c)
  ;; Effects: add vase(?a,?b), del next(?a,?c)
  (:action sip
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (and
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (next ?a ?c)
      (next ?b ?c)
    )
    :effect (and
      (vase ?a ?b)
      (not (next ?a ?c))
    )
  )

  ;; memory ?s ?from ?to
  ;; Pre: cats(?s), spring(?from), spring(?to), next(?s,?from)
  ;; Effects: add next(?s,?to), del next(?s,?from)
  (:action memory
    :parameters (?s - obj ?from - obj ?to - obj)
    :precondition (and
      (cats ?s)
      (spring ?from)
      (spring ?to)
      (next ?s ?from)
    )
    :effect (and
      (next ?s ?to)
      (not (next ?s ?from))
    )
  )

  ;; paltry ?a ?b ?c
  ;; Pre: hand(?a), cats(?b), texture(?c), vase(?a,?b), next(?b,?c)
  ;; Effects: add next(?a,?c), del vase(?a,?b)
  (:action paltry
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (and
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (vase ?a ?b)
      (next ?b ?c)
    )
    :effect (and
      (next ?a ?c)
      (not (vase ?a ?b))
    )
  )

)
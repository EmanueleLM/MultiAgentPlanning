(define (domain multi_move)
  ;; Domain integrating analysts' observations.
  ;; Assumptions (documented):
  ;;  - There is a single object type "object".
  ;;  - next and collect and vase are binary relations. vase is included though unused in the init.
  ;;  - Actions modeled here typically add a new next link (next ?x ?to). To preserve both analysts'
  ;;    scenario goals simultaneously we assume "next" is not a functional pointer and actions do NOT
  ;;    necessarily delete existing next facts (i.e., actions add new next links). This is a deliberate,
  ;;    minimal assumption to reconcile the two analysts' initial/goal sets.
  ;;  - Each action requires that the actor presently has at least one next link (precondition contains
  ;;    (next ?x ?from)), and also requires an enabling unary/binary predicate as inferred by analysts.
  (:requirements :typing)
  (:types object)

  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (sneeze ?o - object)
    (spring ?o - object)
    (stupendous ?o - object)
    (collect ?a - object ?b - object)
    (next ?a - object ?b - object)
    (vase ?a - object ?b - object)
  )

  ;; Actions. All actions add a next link (next ?x ?to) when applicable.
  ;; Preconditions are chosen according to the analysts' plausible mappings; each action is distinct.
  (:action wretched
    :parameters (?x - object ?from - object ?to - object)
    :precondition (and
      (next ?x ?from)
      (hand ?x)
      (spring ?to)
    )
    :effect (and
      (next ?x ?to)
    )
  )

  (:action clip
    :parameters (?x - object ?from - object ?to - object)
    :precondition (and
      (next ?x ?from)
      (texture ?to)
    )
    :effect (and
      (next ?x ?to)
    )
  )

  (:action tightfisted
    :parameters (?x - object ?from - object ?to - object ?c - object)
    :precondition (and
      (next ?x ?from)
      ;; requires that the intended target is part of some collect relation (as inferred)
      (collect ?to ?c)
    )
    :effect (and
      (next ?x ?to)
    )
  )

  (:action sip
    :parameters (?x - object ?from - object ?to - object)
    :precondition (and
      (next ?x ?from)
      (sneeze ?x)
      (spring ?to)
    )
    :effect (and
      (next ?x ?to)
    )
  )

  (:action memory
    :parameters (?x - object ?from - object ?to - object)
    :precondition (and
      (next ?x ?from)
      (stupendous ?to)
    )
    :effect (and
      (next ?x ?to)
    )
  )

  (:action paltry
    :parameters (?x - object ?from - object ?to - object)
    :precondition (and
      (next ?x ?from)
      (texture ?to)
    )
    :effect (and
      (next ?x ?to)
    )
  )
)
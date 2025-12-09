(define (domain object-ordering)
  (:requirements :strips :typing :negative-preconditions)
  (:types object agent)

  (:predicates
    ;; next relation: x is immediately before y
    (next ?x - object ?y - object)

    ;; free flags to enforce at-most-one successor/predecessor
    (succ-free ?x - object)   ;; ?x currently has no successor
    (pred-free ?y - object)   ;; ?y currently has no predecessor

    ;; agent identity predicates (used to keep agent-origin actions distinct)
    (is-p1 ?ag - agent)
    (is-p2 ?ag - agent)

    ;; record which agent established a next relation
    (linked-by ?x - object ?y - object ?ag - agent)
  )

  ;; Action executed by planner/agent P1 to establish a next relation
  (:action link-by-p1
    :parameters (?ag - agent ?x - object ?y - object)
    :precondition (and
                    (is-p1 ?ag)
                    (succ-free ?x)
                    (pred-free ?y)
                    (not (next ?x ?y))
                  )
    :effect (and
              (next ?x ?y)
              (linked-by ?x ?y ?ag)
              (not (succ-free ?x))
              (not (pred-free ?y))
            )
  )

  ;; Action executed by planner/agent P2 to establish a next relation
  (:action link-by-p2
    :parameters (?ag - agent ?x - object ?y - object)
    :precondition (and
                    (is-p2 ?ag)
                    (succ-free ?x)
                    (pred-free ?y)
                    (not (next ?x ?y))
                  )
    :effect (and
              (next ?x ?y)
              (linked-by ?x ?y ?ag)
              (not (succ-free ?x))
              (not (pred-free ?y))
            )
  )
)
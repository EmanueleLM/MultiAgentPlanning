(define (domain blocks-multiagent)
  (:requirements :strips :typing)
  (:types block agent)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?ag - agent ?x - block)
    (handempty ?ag - agent)
  )

  ;; Agent pickup from table
  (:action pickup-by
    :parameters (?ag - agent ?b - block)
    :precondition (and
                    (handempty ?ag)
                    (clear ?b)
                    (ontable ?b))
    :effect (and
              (not (ontable ?b))
              (not (clear ?b))
              (not (handempty ?ag))
              (holding ?ag ?b))
  )

  ;; Agent unstack a block from another block
  (:action unstack-by
    :parameters (?ag - agent ?b - block ?under - block)
    :precondition (and
                    (handempty ?ag)
                    (on ?b ?under)
                    (clear ?b))
    :effect (and
              (not (on ?b ?under))
              (not (clear ?b))
              (not (handempty ?ag))
              (holding ?ag ?b)
              (clear ?under))
  )

  ;; Agent put a held block down on the table
  (:action putdown-by
    :parameters (?ag - agent ?b - block)
    :precondition (and
                    (holding ?ag ?b))
    :effect (and
              (ontable ?b)
              (clear ?b)
              (handempty ?ag)
              (not (holding ?ag ?b)))
  )

  ;; Agent stack a held block onto another block
  (:action stack-by
    :parameters (?ag - agent ?b - block ?under - block)
    :precondition (and
                    (holding ?ag ?b)
                    (clear ?under))
    :effect (and
              (on ?b ?under)
              (clear ?b)
              (handempty ?ag)
              (not (holding ?ag ?b))
              (not (clear ?under)))
  )
)
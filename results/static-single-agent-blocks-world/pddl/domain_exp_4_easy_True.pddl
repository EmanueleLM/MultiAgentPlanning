(define (domain blockworld)
  (:requirements :typing :equality)

  (:types block)

  (:constants table)

  ;; ----- Predicates -----
  ;;  on ?x ?y  :  ?x is sitting on ?y (where ?y can be a block or the table)
  ;;  clear ?x :  no block is on top of ?x
  (:predicates
    (on ?x - block ?y - (either block table))
    (clear ?x - (either block table))
  )

  ;; ----- Actions -----
  ;;  Move a clear block onto another clear block or onto the table.
  (:action move
    :parameters (?b - block ?from - (either block table) ?to   - (either block table))
    :preconditions (and
                     (clear ?b)
                     (on ?b ?from)
                     (clear ?to)
                     (not (= ?b ?to))          ; cannot move a block onto itself
                    )
    :effects (and
                (not (on ?b ?from))           ; it is no longer on the old support
                (on ?b ?to)                   ; it is on the new support
                (clear ?from)                 ; the block beneath becomes clear
                (not (clear ?to))             ; the new support is no longer clear
              )
  )
)
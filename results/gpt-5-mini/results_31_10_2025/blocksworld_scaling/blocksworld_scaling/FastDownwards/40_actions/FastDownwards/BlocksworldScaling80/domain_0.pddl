(define (domain two-agent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types place block - place)

  (:predicates
    (on ?b - block ?p - place)    ; block ?b is directly on place ?p (block or table)
    (clear ?p - place)            ; place ?p has nothing on top of it
    (vowel ?b - block)            ; block ?b is a vowel-block (A, E, I, O)
    (consonant ?b - block)        ; block ?b is a consonant-block (all others)
  )

  ;; Vowel-agent moves: may move exactly one block whose name begins with a vowel,
  ;; only if that block is currently the top of a stack (clear), and the destination
  ;; place (another block or the table) is clear.
  (:action move-vowel
    :parameters (?b - block ?from - place ?to - place)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Consonant-agent moves: same structure but restricted to consonant blocks.
  (:action move-consonant
    :parameters (?b - block ?from - place ?to - place)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )
)
(define (domain blocksworld-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    block - place
    vowel consonant - block
  )

  (:predicates
    ;; a block is on a place (a place may be a stack, the table, or another block)
    (on ?b - block ?p - place)
    ;; place has no block directly on top of it (for blocks this means the block is top)
    (clear ?p - place)
  )

  ;; Vowel-agent move: may move only vowels (A, I, E).
  ;; Moves only top blocks and only onto top-of-stack locations or the table.
  (:action vowel-agent-move
    :parameters (?b - vowel ?from - place ?to - place)
    :precondition (and
      (on ?b ?from)
      (clear ?b)          ;; ?b must be top (no block on it)
      (clear ?to)         ;; destination must be a top location (top block) or the table (which is treated as clear)
      (not (= ?from ?to)) ;; source and destination must differ
      (not (= ?b ?to))    ;; cannot move a block onto itself
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))  ;; destination now has a block on top -> not clear
      (clear ?from)      ;; source place becomes clear after removing ?b
    )
  )

  ;; Consonant-agent move: may move only consonants.
  ;; Same structural restrictions as the vowel move, but restricted by type.
  (:action consonant-agent-move
    :parameters (?b - consonant ?from - place ?to - place)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (not (= ?from ?to))
      (not (= ?b ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )
)
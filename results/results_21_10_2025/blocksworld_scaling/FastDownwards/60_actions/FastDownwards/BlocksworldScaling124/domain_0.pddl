(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types place block stack)
  (:predicates
    (on ?b - block ?p - place)       ; block ?b is directly on place ?p (place = block or stack)
    (clear ?p - place)               ; nothing is on top of place ?p
    (vowel ?b - block)               ; block is vowel-agent's
    (consonant ?b - block)           ; block is consonant-agent's
  )

  ;; Vowel-agent move action: moves a single top vowel block to any clear place (block or stack).
  (:action move-vowel
    :parameters (?b - block ?from - place ?to - place)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)            ; only top blocks can be moved
      (clear ?to)           ; destination must be top/clear
      (not (= ?from ?to))   ; must change position
      (not (= ?to ?b))      ; cannot place onto itself
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))     ; destination is no longer clear
      (clear ?from)         ; the place we removed from becomes clear
      (clear ?b)            ; moved block is top (remains clear)
    )
  )

  ;; Consonant-agent move action: moves a single top consonant block to any clear place (block or stack).
  (:action move-consonant
    :parameters (?b - block ?from - place ?to - place)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (not (= ?from ?to))
      (not (= ?to ?b))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?b)
    )
  )
)
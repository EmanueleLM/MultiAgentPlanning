;; Domain: blocksworld_multiagent
;; Modeling choices:
;; - Two agent classes of actions are encoded explicitly with prefixes:
;;     vowel_agent_*  -- can move only vowel-labelled blocks (A, E, I)
;;     consonant_agent_* -- can move only consonant-labelled blocks (others)
;; - To avoid use of :equality in :requirements, pairwise inequality is encoded
;;   via the predicate (different ?x ?y) and initialized for every ordered pair
;;   of distinct blocks in the problem file.
;; - To keep effects STRIPS-compatible (no conditional effects), each move action
;;   is split into "from_block" and "from_table" variants so we can add the
;;   (clear ?from) effect only when the previous support was a block.
;; - A dedicated object "table" of type table is used as the table support.
;; - The domain uses predicates: vowel, consonant, clear, on, different.
(define (domain blocksworld_multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block table)

  (:predicates
    (vowel ?x - block)
    (consonant ?x - block)
    (clear ?x - block)
    ;; on ?x ?y: block ?x is directly on support ?y (support is either block or table object)
    (on ?x - block ?y - (either block table))
    ;; pairwise inequality encoded explicitly in problem init
    (different ?x - block ?y - block)
  )

  ;; ---------- Vowel-agent actions (may move only vowel-labelled blocks) ----------
  ;; Move vowel block from a block support onto another block
  (:action vowel_agent_move_vowel_onto_block_from_block
    :parameters (?x - block ?from - block ?y - block)
    :precondition (and
                   (vowel ?x)
                   (clear ?x)
                   (clear ?y)
                   (on ?x ?from)
                   (different ?x ?y)
                  )
    :effect (and
             (not (on ?x ?from))
             (on ?x ?y)
             (not (clear ?y))
             (clear ?x)
             (clear ?from)
            )
  )

  ;; Move vowel block from table onto a block
  (:action vowel_agent_move_vowel_onto_block_from_table
    :parameters (?x - block ?y - block)
    :precondition (and
                   (vowel ?x)
                   (clear ?x)
                   (clear ?y)
                   (on ?x table)
                   (different ?x ?y)
                  )
    :effect (and
             (not (on ?x table))
             (on ?x ?y)
             (not (clear ?y))
             (clear ?x)
            )
  )

  ;; Move vowel block from a block onto the table
  (:action vowel_agent_move_vowel_onto_table_from_block
    :parameters (?x - block ?from - block)
    :precondition (and
                   (vowel ?x)
                   (clear ?x)
                   (on ?x ?from)
                  )
    :effect (and
             (not (on ?x ?from))
             (on ?x table)
             (clear ?x)
             (clear ?from)
            )
  )

  ;; (Optional) Move vowel block that is already on table to table (noop kept out to reduce redundancy)

  ;; ---------- Consonant-agent actions (may move only consonant-labelled blocks) ----------
  ;; Move consonant block from a block support onto another block
  (:action consonant_agent_move_block_onto_block_from_block
    :parameters (?x - block ?from - block ?y - block)
    :precondition (and
                   (consonant ?x)
                   (clear ?x)
                   (clear ?y)
                   (on ?x ?from)
                   (different ?x ?y)
                  )
    :effect (and
             (not (on ?x ?from))
             (on ?x ?y)
             (not (clear ?y))
             (clear ?x)
             (clear ?from)
            )
  )

  ;; Move consonant block from table onto a block
  (:action consonant_agent_move_block_onto_block_from_table
    :parameters (?x - block ?y - block)
    :precondition (and
                   (consonant ?x)
                   (clear ?x)
                   (clear ?y)
                   (on ?x table)
                   (different ?x ?y)
                  )
    :effect (and
             (not (on ?x table))
             (on ?x ?y)
             (not (clear ?y))
             (clear ?x)
            )
  )

  ;; Move consonant block from a block onto the table
  (:action consonant_agent_move_block_to_table_from_block
    :parameters (?x - block ?from - block)
    :precondition (and
                   (consonant ?x)
                   (clear ?x)
                   (on ?x ?from)
                  )
    :effect (and
             (not (on ?x ?from))
             (on ?x table)
             (clear ?x)
             (clear ?from)
            )
  )

  ;; (Optional) Move consonant block already on table to table (noop omitted)
)
(define (domain hanoi-4disks-3pegs)
  (:requirements :strips :typing :negative-preconditions)
  ;; disk and peg are both kinds of places
  (:types place stage disk peg - place)

  (:predicates
    ;; disk is directly on a place (a place is either a peg or another disk)
    (on ?d - disk ?p - place)

    ;; a place (peg or disk) has nothing immediately on top of it
    (clear ?p - place)

    ;; size relation: smaller x y means x is strictly smaller than y
    (smaller ?x - disk ?y - disk)

    ;; explicit stage/time ordering to force contiguous moves
    (current ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; Move a top disk onto an empty peg (peg must be clear).
  ;; Enforces: disk is topmost at source, target peg is empty on top,
  ;; and move advances to successor stage (contiguous single-step progression).
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)          ;; ?d must be topmost on its source place
      (clear ?to)         ;; target peg must have nothing on top (empty top)
      (current ?s)
      (succ ?s ?s2)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      ;; after removing ?d, its former supporting place becomes clear
      (clear ?from)

      ;; target peg is no longer clear because ?d now sits on it
      (not (clear ?to))

      ;; advance stage (enforces contiguous progression)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk onto another disk (target disk must be clear and larger).
  ;; Enforces: disk is topmost at source, target disk is topmost and larger,
  ;; and move advances to successor stage (contiguous single-step progression).
  (:action move-disk-onto-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)          ;; ?d must be topmost at source
      (clear ?to)         ;; target disk must be topmost (nothing on it)
      (smaller ?d ?to)    ;; cannot place a larger disk onto a smaller one
      (current ?s)
      (succ ?s ?s2)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      ;; the support ?from (disk or peg) becomes clear after removal
      (clear ?from)

      ;; target disk is no longer clear (it now has ?d on top)
      (not (clear ?to))

      ;; advance stage (enforces contiguous progression)
      (not (current ?s))
      (current ?s2)
    )
  )
)
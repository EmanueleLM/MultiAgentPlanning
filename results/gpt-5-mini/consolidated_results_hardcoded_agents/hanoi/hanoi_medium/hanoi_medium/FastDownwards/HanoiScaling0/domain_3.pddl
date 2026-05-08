(define (domain hanoi-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - support stage)

  (:predicates
    ;; direct support relation: disk is immediately on support (disk or peg)
    (on ?d - disk ?s - support)
    ;; nothing directly on top of the support (disk or peg)
    (clear ?s - support)
    ;; static size ordering (true for initial facts only)
    (smaller ?d1 - disk ?d2 - disk)
    ;; discrete stage/time bookkeeping to enforce contiguous progression
    (stage ?t - stage)
    (next ?t - stage ?t2 - stage)
    (current ?t - stage)
  )

  ;; Move a top disk from a support (peg or disk) onto an empty peg,
  ;; advancing the discrete stage by one. Enforces distinct source/target.
  (:action move-to-peg
    :parameters (?d - disk ?from - support ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (on ?d ?from)           ; disk is immediately on support ?from
      (clear ?d)              ; only top disks may be moved
      (clear ?to)             ; destination peg must be empty (top)
      (current ?t)            ; must be at current stage ?t
      (next ?t ?t2)           ; must progress to the immediate successor stage ?t2
      (not (= ?from ?to))     ; must actually change support
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)           ; the former support now has nothing directly on it
      (not (clear ?to))       ; destination peg now has a disk directly on it
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk from a support (peg or disk) onto another top disk,
  ;; advancing the discrete stage by one. Destination disk must be larger.
  (:action move-onto-disk
    :parameters (?d - disk ?from - support ?tgt - disk ?t - stage ?t2 - stage)
    :precondition (and
      (on ?d ?from)           ; disk is immediately on support ?from
      (clear ?d)              ; only top disks may be moved
      (clear ?tgt)            ; target disk must be top
      (smaller ?d ?tgt)       ; moved disk must be smaller than target disk
      (current ?t)
      (next ?t ?t2)
      (not (= ?from ?tgt))    ; ensure a real change of support
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?tgt)
      (clear ?from)           ; the former support now has nothing directly on it
      (not (clear ?tgt))      ; target disk now has a disk directly on it
      (not (current ?t))
      (current ?t2)
    )
  )
)
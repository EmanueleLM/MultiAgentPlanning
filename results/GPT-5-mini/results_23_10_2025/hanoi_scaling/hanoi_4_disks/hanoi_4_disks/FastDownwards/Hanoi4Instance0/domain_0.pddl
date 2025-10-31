(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (on-peg ?d - disk ?p - peg)        ; disk is directly on peg
    (on-disk ?d - disk ?under - disk) ; disk is directly on another disk
    (top ?d - disk ?p - peg)          ; disk is the top disk of peg
    (empty ?p - peg)                  ; peg is empty (no disks)
    (clear ?d - disk)                 ; no disk on top of this disk
    (smaller ?a - disk ?b - disk)     ; a is smaller than b
  )

  ; Moves where the moving disk is directly on a peg and destination is empty
  (:action move-left-to-middle-frompeg-to-empty
    :parameters (?d - disk ?src - peg ?dst - peg)
    :precondition (and
      (on-peg ?d ?src)
      (top ?d ?src)
      (empty ?dst)
      (clear ?d)
      (= ?src left) (= ?dst middle)
    )
    :effect (and
      (not (on-peg ?d ?src))
      (not (top ?d ?src))
      (not (empty ?dst))
      (on-peg ?d ?dst)
      (top ?d ?dst)
      (empty ?src)
    )
  )

  (:action move-left-to-right-frompeg-to-empty
    :parameters (?d - disk ?src - peg ?dst - peg)
    :precondition (and
      (on-peg ?d ?src)
      (top ?d ?src)
      (empty ?dst)
      (clear ?d)
      (= ?src left) (= ?dst right)
    )
    :effect (and
      (not (on-peg ?d ?src))
      (not (top ?d ?src))
      (not (empty ?dst))
      (on-peg ?d ?dst)
      (top ?d ?dst)
      (empty ?src)
    )
  )

  (:action move-middle-to-left-frompeg-to-empty
    :parameters (?d - disk ?src - peg ?dst - peg)
    :precondition (and
      (on-peg ?d ?src)
      (top ?d ?src)
      (empty ?dst)
      (clear ?d)
      (= ?src middle) (= ?dst left)
    )
    :effect (and
      (not (on-peg ?d ?src))
      (not (top ?d ?src))
      (not (empty ?dst))
      (on-peg ?d ?dst)
      (top ?d ?dst)
      (empty ?src)
    )
  )

  (:action move-middle-to-right-frompeg-to-empty
    :parameters (?d - disk ?src - peg ?dst - peg)
    :precondition (and
      (on-peg ?d ?src)
      (top ?d ?src)
      (empty ?dst)
      (clear ?d)
      (= ?src middle) (= ?dst right)
    )
    :effect (and
      (not (on-peg ?d ?src))
      (not (top ?d ?src))
      (not (empty ?dst))
      (on-peg ?d ?dst)
      (top ?d ?dst)
      (empty ?src)
    )
  )

  (:action move-right-to-left-frompeg-to-empty
    :parameters (?d - disk ?src - peg ?dst - peg)
    :precondition (and
      (on-peg ?d ?src)
      (top ?d ?src)
      (empty ?dst)
      (clear ?d)
      (= ?src right) (= ?dst left)
    )
    :effect (and
      (not (on-peg ?d ?src))
      (not (top ?d ?src))
      (not (empty ?dst))
      (on-peg ?d ?dst)
      (top ?d ?dst)
      (empty ?src)
    )
  )

  (:action move-right-to-middle-frompeg-to-empty
    :parameters (?d - disk ?src - peg ?dst - peg)
    :precondition (and
      (on-peg ?d ?src)
      (top ?d ?src)
      (empty ?dst)
      (clear ?d)
      (= ?src right) (= ?dst middle)
    )
    :effect (and
      (not (on-peg ?d ?src))
      (not (top ?d ?src))
      (not (empty ?dst))
      (on-peg ?d ?dst)
      (top ?d ?dst)
      (empty ?src)
    )
  )

  ; Moves where the moving disk is directly on a peg and destination has a top disk
  (:action move-left-to-middle-frompeg-to-stack
    :parameters (?d - disk ?src - peg ?dst - peg ?dsttop - disk)
    :precondition (and
      (on-peg ?d ?src)
      (top ?d ?src)
      (top ?dsttop ?dst)
      (clear ?d)
      (smaller ?d ?dsttop)
      (= ?src left) (= ?dst middle)
    )
    :effect (and
      (not (on-peg ?d ?src))
      (not (top ?d ?src))
      (not (top ?dsttop ?dst))
      (not (clear ?dsttop))
      (on-disk ?d ?dsttop)
      (top ?d ?dst)
      (empty ?src)
    )
  )

  (:action move-left-to-right-frompeg-to-stack
    :parameters (?d - disk ?src - peg ?dst - peg ?dsttop - disk)
    :precondition (and
      (on-peg ?d ?src)
      (top ?d ?src)
      (top ?dsttop ?dst)
      (clear ?d)
      (smaller ?d ?dsttop)
      (= ?src left) (= ?dst right)
    )
    :effect (and
      (not (on-peg ?d ?src))
      (not (top ?d ?src))
      (not (top ?dsttop ?dst))
      (not (clear ?dsttop))
      (on-disk ?d ?dsttop)
      (top ?d ?dst)
      (empty ?src)
    )
  )

  (:action move-middle-to-left-frompeg-to-stack
    :parameters (?d - disk ?src - peg ?dst - peg ?dsttop - disk)
    :precondition (and
      (on-peg ?d ?src)
      (top ?d ?src)
      (top ?dsttop ?dst)
      (clear ?d)
      (smaller ?d ?dsttop)
      (= ?src middle) (= ?dst left)
    )
    :effect (and
      (not (on-peg ?d ?src))
      (not (top ?d ?src))
      (not (top ?dsttop ?dst))
      (not (clear ?dsttop))
      (on-disk ?d ?dsttop)
      (top ?d ?dst)
      (empty ?src)
    )
  )

  (:action move-middle-to-right-frompeg-to-stack
    :parameters (?d - disk ?src - peg ?dst - peg ?dsttop - disk)
    :precondition (and
      (on-peg ?d ?src)
      (top ?d ?src)
      (top ?dsttop ?dst)
      (clear ?d)
      (smaller ?d ?dsttop)
      (= ?src middle) (= ?dst right)
    )
    :effect (and
      (not (on-peg ?d ?src))
      (not (top ?d ?src))
      (not (top ?dsttop ?dst))
      (not (clear ?dsttop))
      (on-disk ?d ?dsttop)
      (top ?d ?dst)
      (empty ?src)
    )
  )

  (:action move-right-to-left-frompeg-to-stack
    :parameters (?d - disk ?src - peg ?dst - peg ?dsttop - disk)
    :precondition (and
      (on-peg ?d ?src)
      (top ?d ?src)
      (top ?dsttop ?dst)
      (clear ?d)
      (smaller ?d ?dsttop)
      (= ?src right) (= ?dst left)
    )
    :effect (and
      (not (on-peg ?d ?src))
      (not (top ?d ?src))
      (not (top ?dsttop ?dst))
      (not (clear ?dsttop))
      (on-disk ?d ?dsttop)
      (top ?d ?dst)
      (empty ?src)
    )
  )

  (:action move-right-to-middle-frompeg-to-stack
    :parameters (?d - disk ?src - peg ?dst - peg ?dsttop - disk)
    :precondition (and
      (on-peg ?d ?src)
      (top ?d ?src)
      (top ?dsttop ?dst)
      (clear ?d)
      (smaller ?d ?dsttop)
      (= ?src right) (= ?dst middle)
    )
    :effect (and
      (not (on-peg ?d ?src))
      (not (top ?d ?src))
      (not (top ?dsttop ?dst))
      (not (clear ?dsttop))
      (on-disk ?d ?dsttop)
      (top ?d ?dst)
      (empty ?src)
    )
  )

  ; Moves where the moving disk is on another disk and destination is empty
  (:action move-left-to-middle-fromdisk-to-empty
    :parameters (?d - disk ?src - peg ?under - disk ?dst - peg)
    :precondition (and
      (on-disk ?d ?under)
      (top ?d ?src)
      (empty ?dst)
      (clear ?d)
      (= ?src left) (= ?dst middle)
    )
    :effect (and
      (not (on-disk ?d ?under))
      (not (top ?d ?src))
      (top ?under ?src)
      (clear ?under)
      (not (empty ?dst))
      (on-peg ?d ?dst)
      (top ?d ?dst)
    )
  )

  (:action move-left-to-right-fromdisk-to-empty
    :parameters (?d - disk ?src - peg ?under - disk ?dst - peg)
    :precondition (and
      (on-disk ?d ?under)
      (top ?d ?src)
      (empty ?dst)
      (clear ?d)
      (= ?src left) (= ?dst right)
    )
    :effect (and
      (not (on-disk ?d ?under))
      (not (top ?d ?src))
      (top ?under ?src)
      (clear ?under)
      (not (empty ?dst))
      (on-peg ?d ?dst)
      (top ?d ?dst)
    )
  )

  (:action move-middle-to-left-fromdisk-to-empty
    :parameters (?d - disk ?src - peg ?under - disk ?dst - peg)
    :precondition (and
      (on-disk ?d ?under)
      (top ?d ?src)
      (empty ?dst)
      (clear ?d)
      (= ?src middle) (= ?dst left)
    )
    :effect (and
      (not (on-disk ?d ?under))
      (not (top ?d ?src))
      (top ?under ?src)
      (clear ?under)
      (not (empty ?dst))
      (on-peg ?d ?dst)
      (top ?d ?dst)
    )
  )

  (:action move-middle-to-right-fromdisk-to-empty
    :parameters (?d - disk ?src - peg ?under - disk ?dst - peg)
    :precondition (and
      (on-disk ?d ?under)
      (top ?d ?src)
      (empty ?dst)
      (clear ?d)
      (= ?src middle) (= ?dst right)
    )
    :effect (and
      (not (on-disk ?d ?under))
      (not (top ?d ?src))
      (top ?under ?src)
      (clear ?under)
      (not (empty ?dst))
      (on-peg ?d ?dst)
      (top ?d ?dst)
    )
  )

  (:action move-right-to-left-fromdisk-to-empty
    :parameters (?d - disk ?src - peg ?under - disk ?dst - peg)
    :precondition (and
      (on-disk ?d ?under)
      (top ?d ?src)
      (empty ?dst)
      (clear ?d)
      (= ?src right) (= ?dst left)
    )
    :effect (and
      (not (on-disk ?d ?under))
      (not (top ?d ?src))
      (top ?under ?src)
      (clear ?under)
      (not (empty ?dst))
      (on-peg ?d ?dst)
      (top ?d ?dst)
    )
  )

  (:action move-right-to-middle-fromdisk-to-empty
    :parameters (?d - disk ?src - peg ?under - disk ?dst - peg)
    :precondition (and
      (on-disk ?d ?under)
      (top ?d ?src)
      (empty ?dst)
      (clear ?d)
      (= ?src right) (= ?dst middle)
    )
    :effect (and
      (not (on-disk ?d ?under))
      (not (top ?d ?src))
      (top ?under ?src)
      (clear ?under)
      (not (empty ?dst))
      (on-peg ?d ?dst)
      (top ?d ?dst)
    )
  )

  ; Moves where the moving disk is on another disk and destination has a top disk
  (:action move-left-to-middle-fromdisk-to-stack
    :parameters (?d - disk ?src - peg ?under - disk ?dst - peg ?dsttop - disk)
    :precondition (and
      (on-disk ?d ?under)
      (top ?d ?src)
      (top ?dsttop ?dst)
      (clear ?d)
      (smaller ?d ?dsttop)
      (= ?src left) (= ?dst middle)
    )
    :effect (and
      (not (on-disk ?d ?under))
      (not (top ?d ?src))
      (top ?under ?src)
      (clear ?under)
      (not (top ?dsttop ?dst))
      (not (clear ?dsttop))
      (on-disk ?d ?dsttop)
      (top ?d ?dst)
    )
  )

  (:action move-left-to-right-fromdisk-to-stack
    :parameters (?d - disk ?src - peg ?under - disk ?dst - peg ?dsttop - disk)
    :precondition (and
      (on-disk ?d ?under)
      (top ?d ?src)
      (top ?dsttop ?dst)
      (clear ?d)
      (smaller ?d ?dsttop)
      (= ?src left) (= ?dst right)
    )
    :effect (and
      (not (on-disk ?d ?under))
      (not (top ?d ?src))
      (top ?under ?src)
      (clear ?under)
      (not (top ?dsttop ?dst))
      (not (clear ?dsttop))
      (on-disk ?d ?dsttop)
      (top ?d ?dst)
    )
  )

  (:action move-middle-to-left-fromdisk-to-stack
    :parameters (?d - disk ?src - peg ?under - disk ?dst - peg ?dsttop - disk)
    :precondition (and
      (on-disk ?d ?under)
      (top ?d ?src)
      (top ?dsttop ?dst)
      (clear ?d)
      (smaller ?d ?dsttop)
      (= ?src middle) (= ?dst left)
    )
    :effect (and
      (not (on-disk ?d ?under))
      (not (top ?d ?src))
      (top ?under ?src)
      (clear ?under)
      (not (top ?dsttop ?dst))
      (not (clear ?dsttop))
      (on-disk ?d ?dsttop)
      (top ?d ?dst)
    )
  )

  (:action move-middle-to-right-fromdisk-to-stack
    :parameters (?d - disk ?src - peg ?under - disk ?dst - peg ?dsttop - disk)
    :precondition (and
      (on-disk ?d ?under)
      (top ?d ?src)
      (top ?dsttop ?dst)
      (clear ?d)
      (smaller ?d ?dsttop)
      (= ?src middle) (= ?dst right)
    )
    :effect (and
      (not (on-disk ?d ?under))
      (not (top ?d ?src))
      (top ?under ?src)
      (clear ?under)
      (not (top ?dsttop ?dst))
      (not (clear ?dsttop))
      (on-disk ?d ?dsttop)
      (top ?d ?dst)
    )
  )

  (:action move-right-to-left-fromdisk-to-stack
    :parameters (?d - disk ?src - peg ?under - disk ?dst - peg ?dsttop - disk)
    :precondition (and
      (on-disk ?d ?under)
      (top ?d ?src)
      (top ?dsttop ?dst)
      (clear ?d)
      (smaller ?d ?dsttop)
      (= ?src right) (= ?dst left)
    )
    :effect (and
      (not (on-disk ?d ?under))
      (not (top ?d ?src))
      (top ?under ?src)
      (clear ?under)
      (not (top ?dsttop ?dst))
      (not (clear ?dsttop))
      (on-disk ?d ?dsttop)
      (top ?d ?dst)
    )
  )

  (:action move-right-to-middle-fromdisk-to-stack
    :parameters (?d - disk ?src - peg ?under - disk ?dst - peg ?dsttop - disk)
    :precondition (and
      (on-disk ?d ?under)
      (top ?d ?src)
      (top ?dsttop ?dst)
      (clear ?d)
      (smaller ?d ?dsttop)
      (= ?src right) (= ?dst middle)
    )
    :effect (and
      (not (on-disk ?d ?under))
      (not (top ?d ?src))
      (top ?under ?src)
      (clear ?under)
      (not (top ?dsttop ?dst))
      (not (clear ?dsttop))
      (on-disk ?d ?dsttop)
      (top ?d ?dst)
    )
  )

)
(define (domain hanoi-5-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)
  (:predicates
    (on-p ?d - disk ?p - peg)        ; disk directly on peg
    (on-d ?d - disk ?u - disk)       ; disk directly on another disk
    (top ?d - disk)                  ; disk has no disk on top
    (peg-empty ?p - peg)             ; peg has no disks
    (current-step ?s - step)         ; which step we are at
  )

  ;; STEP 1: move A from on-d A B -> on-p A middle
  (:action move-1
    :precondition (and
      (current-step s1)
      (on-d a b) (on-d b c) (on-d c d) (on-d d e) (on-p e left)
      (peg-empty middle) (peg-empty right)
      (top a)
    )
    :effect (and
      (not (on-d a b)) (on-p a middle)
      (not (peg-empty middle))
      (top b)
      (not (current-step s1)) (current-step s2)
    )
  )

  ;; STEP 2: move B from left->right: B from on-d b c -> on-p b right
  (:action move-2
    :precondition (and
      (current-step s2)
      (on-d b c) (on-d c d) (on-d d e) (on-p e left)
      (on-p a middle)
      (peg-empty right)
      (top b) (top a)
    )
    :effect (and
      (not (on-d b c)) (on-p b right)
      (not (peg-empty right))
      (top c)
      (not (current-step s2)) (current-step s3)
    )
  )

  ;; STEP 3: middle->right: A from on-p a middle -> on-d a b
  (:action move-3
    :precondition (and
      (current-step s3)
      (on-p a middle) (on-p b right) (on-d c d) (on-d d e) (on-p e left)
      (peg-empty middle)  ; after move2, middle becomes empty
      (top a) (top b) (top c)
    )
    :effect (and
      (not (on-p a middle)) (on-d a b)
      (not (peg-empty middle)) ; middle might be empty precondition but after this action it remains empty -> keep semantic consistent by not setting peg-empty middle
      (not (current-step s3)) (current-step s4)
    )
  )

  ;; STEP 4: left->middle: C from on-d c d -> on-p c middle
  (:action move-4
    :precondition (and
      (current-step s4)
      (on-d c d) (on-d d e) (on-p e left)
      (on-d a b) (on-p b right)
      (peg-empty middle)
      (top c) (top a)
    )
    :effect (and
      (not (on-d c d)) (on-p c middle)
      (not (peg-empty middle))
      (top d)
      (not (current-step s4)) (current-step s5)
    )
  )

  ;; STEP 5: right->left: A from on-d a b -> on-d a d
  (:action move-5
    :precondition (and
      (current-step s5)
      (on-d a b) (on-p b right) (on-p c middle) (on-d d e) (on-p e left)
      (top a) (top c) (top d)
    )
    :effect (and
      (not (on-d a b)) (on-d a d)
      (top b)
      (not (current-step s5)) (current-step s6)
    )
  )

  ;; STEP 6: right->middle: B from on-p b right -> on-d b c
  (:action move-6
    :precondition (and
      (current-step s6)
      (on-d a d) (on-d d e) (on-p e left) (on-p c middle)
      (on-p b right)
      (peg-empty right)
      (top a) (top b)
    )
    :effect (and
      (not (on-p b right)) (on-d b c)
      (peg-empty right)
      (not (current-step s6)) (current-step s7)
    )
  )

  ;; STEP 7: left->middle: A from on-d a d -> on-d a b
  (:action move-7
    :precondition (and
      (current-step s7)
      (on-d a d) (on-d b c) (on-p c middle) (on-d d e) (on-p e left)
      (peg-empty right)
      (top a) (top b)
    )
    :effect (and
      (not (on-d a d)) (on-d a b)
      (top d)
      (not (current-step s7)) (current-step s8)
    )
  )

  ;; STEP 8: left->right: D from on-d d e -> on-p d right
  (:action move-8
    :precondition (and
      (current-step s8)
      (on-d d e) (on-p e left) (on-d a b) (on-d b c) (on-p c middle)
      (peg-empty right)
      (top d) (top a)
    )
    :effect (and
      (not (on-d d e)) (on-p d right)
      (not (peg-empty right))
      (top e)
      (not (current-step s8)) (current-step s9)
    )
  )

  ;; STEP 9: middle->right: A from on-d a b -> on-d a d
  (:action move-9
    :precondition (and
      (current-step s9)
      (on-d a b) (on-d b c) (on-p c middle) (on-p d right) (on-p e left)
      (top a) (top c) (top d)
    )
    :effect (and
      (not (on-d a b)) (on-d a d)
      (top b)
      (not (current-step s9)) (current-step s10)
    )
  )

  ;; STEP 10: middle->left: B from on-d b c -> on-d b e
  (:action move-10
    :precondition (and
      (current-step s10)
      (on-d b c) (on-d c d) (on-d a d) (on-p d right) (on-p e left)
      (on-p c middle)
      (top b) (top a) (top c)
    )
    :effect (and
      (not (on-d b c)) (on-d b e)
      (top c)
      (not (current-step s10)) (current-step s11)
    )
  )

  ;; STEP 11: right->left: A from on-d a d -> on-d a b
  (:action move-11
    :precondition (and
      (current-step s11)
      (on-d a d) (on-d b e) (on-p e left) (on-p d right) (on-p c middle)
      (top a) (top b) (top c)
    )
    :effect (and
      (not (on-d a d)) (on-d a b)
      (top d)
      (not (current-step s11)) (current-step s12)
    )
  )

  ;; STEP 12: middle->right: C from on-p c middle -> on-d c d
  (:action move-12
    :precondition (and
      (current-step s12)
      (on-p c middle) (on-d a b) (on-d b e) (on-p e left) (on-p d right)
      (peg-empty middle)
      (top c) (top a)
    )
    :effect (and
      (not (on-p c middle)) (on-d c d)
      (not (peg-empty middle))
      (top d)
      (not (current-step s12)) (current-step s13)
    )
  )

  ;; STEP 13: left->middle: A from on-d a b -> on-p a middle
  (:action move-13
    :precondition (and
      (current-step s13)
      (on-d a b) (on-d b e) (on-d c d) (on-p d right) (on-p e left)
      (peg-empty middle)
      (top a) (top c)
    )
    :effect (and
      (not (on-d a b)) (on-p a middle)
      (not (peg-empty middle))
      (top b)
      (not (current-step s13)) (current-step s14)
    )
  )

  ;; STEP 14: left->right: B from on-d b e -> on-d b c
  (:action move-14
    :precondition (and
      (current-step s14)
      (on-d b e) (on-p e left) (on-p a middle) (on-d c d) (on-p d right)
      (top b) (top a)
    )
    :effect (and
      (not (on-d b e)) (on-d b c)
      (not (current-step s14)) (current-step s15)
    )
  )

  ;; STEP 15: middle->right: A from on-p a middle -> on-d a b
  (:action move-15
    :precondition (and
      (current-step s15)
      (on-p a middle) (on-d b c) (on-d c d) (on-p d right) (on-p e left)
      (top a) (top b)
    )
    :effect (and
      (not (on-p a middle)) (on-d a b)
      (peg-empty middle)
      (not (current-step s15)) (current-step s16)
    )
  )

  ;; STEP 16: left->middle: E from on-p e left -> on-p e middle
  (:action move-16
    :precondition (and
      (current-step s16)
      (on-p e left) (on-d a b) (on-d b c) (on-d c d) (on-p d right)
      (peg-empty middle)
      (top e) (top a)
    )
    :effect (and
      (not (on-p e left)) (on-p e middle)
      (peg-empty left)
      (not (current-step s16)) (current-step s17)
    )
  )

  ;; STEP 17: right->left: A from on-d a b -> on-p a left
  (:action move-17
    :precondition (and
      (current-step s17)
      (on-d a b) (on-d b c) (on-d c d) (on-p d right) (on-p e middle)
      (peg-empty left)
      (top a) (top e)
    )
    :effect (and
      (not (on-d a b)) (on-p a left)
      (not (peg-empty left))
      (top b)
      (not (current-step s17)) (current-step s18)
    )
  )

  ;; STEP 18: right->middle: B from on-d b c -> on-d b e
  (:action move-18
    :precondition (and
      (current-step s18)
      (on-d b c) (on-d c d) (on-p d right) (on-p e middle) (on-p a left)
      (top b) (top a)
    )
    :effect (and
      (not (on-d b c)) (on-d b e)
      (not (current-step s18)) (current-step s19)
    )
  )

  ;; STEP 19: left->middle: A from on-p a left -> on-d a b
  (:action move-19
    :precondition (and
      (current-step s19)
      (on-p a left) (on-d b e) (on-d c d) (on-p d right) (on-p e middle)
      (top a) (top b)
    )
    :effect (and
      (not (on-p a left)) (on-d a b)
      (peg-empty left)
      (not (current-step s19)) (current-step s20)
    )
  )

  ;; STEP 20: right->left: C from on-d c d -> on-p c left
  (:action move-20
    :precondition (and
      (current-step s20)
      (on-d c d) (on-d a b) (on-d b e) (on-p e middle) (on-p d right)
      (peg-empty left)
      (top c) (top a)
    )
    :effect (and
      (not (on-d c d)) (on-p c left)
      (not (current-step s20)) (current-step s21)
    )
  )

  ;; STEP 21: middle->right: A from on-d a b -> on-d a d
  (:action move-21
    :precondition (and
      (current-step s21)
      (on-d a b) (on-d b e) (on-p e middle) (on-p c left) (on-p d right)
      (top a) (top b) (top c)
    )
    :effect (and
      (not (on-d a b)) (on-d a d)
      (top b)
      (not (current-step s21)) (current-step s22)
    )
  )

  ;; STEP 22: middle->left: B from on-d b e -> on-d b c
  (:action move-22
    :precondition (and
      (current-step s22)
      (on-d b e) (on-p e middle) (on-p c left) (on-d a d) (on-p d right)
      (top b) (top a)
    )
    :effect (and
      (not (on-d b e)) (on-d b c)
      (not (current-step s22)) (current-step s23)
    )
  )

  ;; STEP 23: right->left: A from on-d a d -> on-d a b
  (:action move-23
    :precondition (and
      (current-step s23)
      (on-d a d) (on-d b c) (on-p c left) (on-p e middle) (on-p d right)
      (top a) (top b)
    )
    :effect (and
      (not (on-d a d)) (on-d a b)
      (not (current-step s23)) (current-step s24)
    )
  )

  ;; STEP 24: right->middle: D from on-p d right -> on-d d e
  (:action move-24
    :precondition (and
      (current-step s24)
      (on-p d right) (on-d a b) (on-d b c) (on-p c left) (on-p e middle)
      (top d) (top a)
    )
    :effect (and
      (not (on-p d right)) (on-d d e)
      (peg-empty right)
      (not (current-step s24)) (current-step s25)
    )
  )

  ;; STEP 25: left->middle: A from on-d a b -> on-d a d
  (:action move-25
    :precondition (and
      (current-step s25)
      (on-d a b) (on-d b c) (on-p c left) (on-d d e) (on-p e middle)
      (peg-empty right)
      (top a) (top b)
    )
    :effect (and
      (not (on-d a b)) (on-d a d)
      (top b)
      (not (current-step s25)) (current-step s26)
    )
  )

  ;; STEP 26: left->right: B from on-d b c -> on-p b right
  (:action move-26
    :precondition (and
      (current-step s26)
      (on-d b c) (on-d a d) (on-d d e) (on-p e middle) (on-p c left)
      (peg-empty right)
      (top b) (top a)
    )
    :effect (and
      (not (on-d b c)) (on-p b right)
      (not (peg-empty right))
      (top c)
      (not (current-step s26)) (current-step s27)
    )
  )

  ;; STEP 27: middle->right: A from on-d a d -> on-d a b
  (:action move-27
    :precondition (and
      (current-step s27)
      (on-d a d) (on-p b right) (on-d d e) (on-p e middle) (on-p c left)
      (top a) (top b) (top c)
    )
    :effect (and
      (not (on-d a d)) (on-d a b)
      (top d)
      (not (current-step s27)) (current-step s28)
    )
  )

  ;; STEP 28: left->middle: C from on-p c left -> on-d c d
  (:action move-28
    :precondition (and
      (current-step s28)
      (on-p c left) (on-d a b) (on-p b right) (on-d d e) (on-p e middle)
      (peg-empty left)
      (top c) (top a)
    )
    :effect (and
      (not (on-p c left)) (on-d c d)
      (peg-empty left)
      (not (current-step s28)) (current-step s29)
    )
  )

  ;; STEP 29: right->left: A from on-d a b -> on-p a left
  (:action move-29
    :precondition (and
      (current-step s29)
      (on-d a b) (on-d c d) (on-d d e) (on-p e middle) (on-p b right)
      (peg-empty left)
      (top a) (top c)
    )
    :effect (and
      (not (on-d a b)) (on-p a left)
      (not (peg-empty left))
      (top b)
      (not (current-step s29)) (current-step s30)
    )
  )

  ;; STEP 30: right->middle: B from on-p b right -> on-d b c
  (:action move-30
    :precondition (and
      (current-step s30)
      (on-p b right) (on-p a left) (on-d c d) (on-d d e) (on-p e middle)
      (peg-empty right)
      (top b) (top a)
    )
    :effect (and
      (not (on-p b right)) (on-d b c)
      (peg-empty right)
      (not (current-step s30)) (current-step s31)
    )
  )

  ;; STEP 31: left->middle: A from on-p a left -> on-d a b (final)
  (:action move-31
    :precondition (and
      (current-step s31)
      (on-p a left) (on-d b c) (on-d c d) (on-d d e) (on-p e middle)
      (peg-empty right)
      (top a) (top b)
    )
    :effect (and
      (not (on-p a left)) (on-d a b)
      (peg-empty left)
      (not (current-step s31))
    )
  )

)
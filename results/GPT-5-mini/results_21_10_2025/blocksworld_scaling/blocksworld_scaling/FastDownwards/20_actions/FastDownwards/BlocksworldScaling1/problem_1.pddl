; Problem: BlocksworldScaling1
; Assumptions (documented):
; - We model the table as a special support via predicate (ontable ?b).
; - Table has sufficient free locations; "placing on table" creates/uses an available table spot.
; - Each move is atomic (pick + place in one action) to enforce "one block at a time" semantics.
; - Actions' names indicate agent ownership (vowel- vs consonant-). Only vowel actions can move vowel-labeled blocks; only consonant actions can move consonant-labeled blocks.
; - We resolved any ambiguities conservatively: no extra concurrency constraints (agents act sequentially in planning), and table positions are not individually named.

(define (problem BlocksworldScaling1-Problem)
  (:domain BlocksworldScaling1)

  (:objects
    A B C D E F G H I J K L M N O - block
  )

  (:init
    ; Initial "on" relationships (as provided)
    (ontable D)
    (ontable L)
    (on M L)
    (on J M)

    (ontable O)
    (on K O)
    (on E K)

    (ontable G)
    (on H G)
    (on N H)

    (on I D)
    (on A I)
    (on B A)
    (on C B)
    (on F C)

    ; Which blocks are clear (top of each initial stack)
    (clear F)
    (clear J)
    (clear E)
    (clear N)

    ; Type markers (vowels vs consonants)
    (vowel A)
    (vowel E)
    (vowel I)
    (vowel O)

    (consonant B)
    (consonant C)
    (consonant D)
    (consonant F)
    (consonant G)
    (consonant H)
    (consonant J)
    (consonant K)
    (consonant L)
    (consonant M)
    (consonant N)
  )

  (:goal (and
    ; Goal configuration: A on B on C on D on E on F on G on H on I on J on K on L on M on N and O on table
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J K)
    (on K L)
    (on L M)
    (on M N)
    (on N O)
    (ontable O)
  ))

  ; No metric function required.
)
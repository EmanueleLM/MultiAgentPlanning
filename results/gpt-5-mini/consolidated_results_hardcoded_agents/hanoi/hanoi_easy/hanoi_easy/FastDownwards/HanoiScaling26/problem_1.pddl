(define (problem hanoi_4_orchestrated)
  (:domain hanoi_orchestrated)

  (:objects
    peg_left peg_middle peg_right - peg
    disk_A disk_B disk_C disk_D - disk
  )

  ; Minimal initial facts encoding the single stacked tower on the middle peg.
  (:init
    ; emptiness: left and right are empty; middle is empty=false by omission
    (empty peg_left)
    (empty peg_right)

    ; stack on middle peg (top-to-bottom A,B,C,D)
    (top peg_middle disk_A)
    (on-disk disk_A disk_B)
    (on-disk disk_B disk_C)
    (on-disk disk_C disk_D)
    (on disk_D peg_middle)

    ; size relations (strict ordering). These are the only static size facts needed.
    (smaller disk_A disk_B)
    (smaller disk_A disk_C)
    (smaller disk_A disk_D)
    (smaller disk_B disk_C)
    (smaller disk_B disk_D)
    (smaller disk_C disk_D)
  )

  (:goal (and
    (top peg_left disk_A)
    (on-disk disk_A disk_B)
    (on-disk disk_B disk_C)
    (on-disk disk_C disk_D)
    (on disk_D peg_left)
    (empty peg_middle)
    (empty peg_right)
  ))
)
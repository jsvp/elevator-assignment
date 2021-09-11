CREATE TABLE [INTERACTION] (
  [floor_number] int NOT NULL,
  [elevator_id] int NOT NULL,
  [person_id] int NOT NULL,
  [timestamp] timestamp NOT NULL,
  [direction] nvarchar(255) NOT NULL
)
GO

ALTER TABLE [INTERACTION] ADD FOREIGN KEY ([floor_no]) REFERENCES [FLOOR] ([number])
GO

ALTER TABLE [INTERACTION] ADD FOREIGN KEY ([elevator_id]) REFERENCES [ELEVATOR] ([id])
GO

ALTER TABLE [INTERACTION] ADD FOREIGN KEY ([person_id]) REFERENCES [PERSON] ([id])
GO
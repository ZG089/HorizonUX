//
// Copyright (C) 2025 Luna
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
//

#ifndef HORIZON_H
#define HORIZON_H

#include <string.h>
#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <unistd.h>

// FUCKING function FUCKING declarations.
int isPackageInstalled(const char *packageName);
int manageBlocks(const char *infile, const char *outfile, size_t block_size, size_t count);
int getSystemProperty__(const char *filepath, const char *propertyVariableName);
int maybeSetProp(const char *property, const char *expectedPropertyValue, const char *typeShyt);
int DoWhenPropisinTheSameForm(const char *property, const char *expectedPropertyValue);
bool isBootAnimationExited();
bool isTheDeviceBootCompleted();
bool isTheDeviceisTurnedOn();
char *getSystemProperty(const char *filepath, const char *propertyVariableName);
void sendToastMessages(const char *service, const char *message);
void sendNotification(const char *message);

#endif
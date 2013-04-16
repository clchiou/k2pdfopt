/*
 * Copyright (c) 2013 Che-Liang Chiou. All rights reserved.
 * Use of this source code is governed by the GNU General Public License
 * as published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 */

#ifndef K2PDFOPT_API_H_
#define K2PDFOPT_API_H_

int k2pdfopt_main(int argc, const char *argv[]);

void k2pdfopt_progress_read_pages(int num_pages);
void k2pdfopt_progress_convert(int page_index, int num_output_pages);

#endif  /* K2PDFOPT_API_H_ */
